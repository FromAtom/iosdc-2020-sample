//
//  AppSettingViewModel.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct AppSettingViewModel {
	private let app: App
	private var groups: [Group] {
		return app.groups
	}
	private var selectors: [Selector] {
		return Array(groups.map({ $0.selectors.map({ $0 }) }).joined())
	}

	var title: String {
		return app.name
	}

	var numberOfSections: Int {
		return app.groups.count
	}

	init(app: App) {
		self.app = app
	}

	func numberOfRowsInSection(section: Int) -> Int {
		return groups[section].selectors.count
	}

	func titleForHeaderInSection(section: Int) -> String? {
		return groups[section].title
	}

	func stringValues(forKey: String) -> [String] {
		guard let selector = selectors.first(where: {$0.key == forKey}) as? StringSelector else {
			return []
		}

		return selector.values
	}

	private func selectorForRowAt(indexPath: IndexPath) -> Selector {
		return groups[indexPath.section].selectors[indexPath.row]
	}

	func observableFieldForRowAt(indexPath: IndexPath) -> SelectorObservableField {
		switch selectorForRowAt(indexPath: indexPath) {
		case let selector as BoolSelector:
			let viewModel = BoolSelectorViewModel(selector: selector, bundleID: app.bundleID)
			return viewModel.observableField
		case let selector as StringSelector:
			let viewModel = StringSelectorViewModel(selector: selector, bundleID: app.bundleID)
			return viewModel.observableField
		default:
			fatalError("Unknown selector type")
		}
	}

	func update(value: Bool, forKey: String) {
		for selector in selectors {
			guard selector.key == forKey else {
				continue
			}
			guard let selector = selector as? BoolSelector else {
				continue
			}

			let viewModel = BoolSelectorViewModel(selector: selector, bundleID: app.bundleID)
			viewModel.update(value: value)
		}
	}

	func update(value: String, forKey: String) {
		for selector in selectors {
			guard selector.key == forKey else {
				continue
			}
			guard let selector = selector as? StringSelector else {
				continue
			}

			let viewModel = StringSelectorViewModel(selector: selector, bundleID: app.bundleID)
			viewModel.update(value: value)
		}
	}

	func remove(forKey: String) {
		for selector in selectors {
			guard selector.key == forKey else {
				continue
			}

			switch selector {
			case let boolSelector as BoolSelector:
				let viewModel = BoolSelectorViewModel(selector: boolSelector, bundleID: app.bundleID)
				viewModel.remove()
			case let stringSelector as StringSelector:
				let viewModel = StringSelectorViewModel(selector: stringSelector, bundleID: app.bundleID)
				viewModel.remove()
			default:
				fatalError("Unknown selector type")
			}
		}
	}
}
