//
//  AppSettingTableViewController.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import UIKit

final class AppSettingTableViewController: UITableViewController, Instantiatable {
	typealias ViewModelType = AppSettingViewModel
	var viewModel: AppSettingViewModel!

	override func viewDidLoad() {
        super.viewDidLoad()

		title = viewModel.title
		tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource
extension AppSettingTableViewController {

	override func numberOfSections(in tableView: UITableView) -> Int {
		return viewModel.numberOfSections
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel.numberOfRowsInSection(section: section)
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let observableField = viewModel.observableFieldForRowAt(indexPath: indexPath)

		switch observableField.type {
		case .bool(let key, let selectedValue):
			let cell = tableView.dequeueReusableCell(withIdentifier: "BoolSelectorTableViewCell") as! BoolSelectorTableViewCell

			cell.set(key: key, title: observableField.title, value: selectedValue)
			cell.delegate = self

			return cell
		case .string(let key, let selectedValue):
			let cell = tableView.dequeueReusableCell(withIdentifier: "StringSelectorTableViewCell") as! StringSelectorTableViewCell
			cell.set(key: key, title: observableField.title, selectedValue: selectedValue)
			cell.delegate = self

			return cell
		}
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return viewModel.titleForHeaderInSection(section: section)
	}

}

// MARK: - BoolSelectorTableViewCellDelegate
extension AppSettingTableViewController: BoolSelectorTableViewCellDelegate {

	func didChangeSwitchValue(key: String, value: Bool) {
		viewModel.update(value: value, forKey: key)
	}

}

// MARK: - StringSelectorTableViewCellDelegate
extension AppSettingTableViewController: StringSelectorTableViewCellDelegate {

	func changeButtonTouchUpInside(key: String, sender: UITableViewCell) {
		let values = viewModel.stringValues(forKey: key)

		let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		let deleteAction = UIAlertAction(title: "削除", style: .destructive) { _ in
			self.viewModel.remove(forKey: key)
			self.tableView.reloadData()
		}
		alertController.addAction(deleteAction)

		for value in values {
			let action = UIAlertAction(title: value, style: .default) { _ in
				self.viewModel.update(value: value, forKey: key)
				self.tableView.reloadData()
			}
			alertController.addAction(action)
		}

		let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { _ in
		}
		alertController.addAction(cancelAction)

		alertController.popoverPresentationController?.sourceView = sender
		alertController.popoverPresentationController?.sourceRect = sender.frame
		alertController.popoverPresentationController?.permittedArrowDirections = .any

		present(alertController, animated: true, completion: nil)
	}

}
