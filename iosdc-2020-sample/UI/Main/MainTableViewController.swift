//
//  MainTableViewController.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import UIKit

final class MainTableViewController: UITableViewController {
	private var apps: [App] = []

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Chusha"
		loadApps()
		tableView.reloadData()
	}
}

// MARK: - private functions
private extension MainTableViewController {
	func loadApps() {
		apps = AppsSetting.generate()
	}
}

// MARK: - tableview
extension MainTableViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return apps.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let app = apps[indexPath.row]
		let cell = tableView.dequeueReusableCell(withIdentifier: "AppsTableViewCell", for: indexPath)
		cell.textLabel?.text = app.name
		return cell
	}

	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "アプリ一覧"
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let app = apps[indexPath.row]
		let viewModel = AppSettingViewModel(app: app)
		let vc = AppSettingTableViewController.instantiateFromStoryboard(viewModel: viewModel)
		navigationController?.pushViewController(vc, animated: true)
	}
}

