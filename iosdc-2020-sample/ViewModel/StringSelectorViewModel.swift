//
//  StringSelectorViewModel.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct StringSelectorViewModel {
	private let selector: StringSelector
	private let repository: StringSettingRepository
	var observableField: SelectorObservableField {
		return SelectorObservableField(title: selector.title, type: .string(key: repository.key, selectedValue: repository.get()))
	}

	init(selector: StringSelector, bundleID: String) {
		self.selector = selector
		self.repository = StringSettingRepository(bundleID: bundleID, key: selector.key)
	}

	func update(value: String) {
		repository.set(value)
	}

	func remove() {
		repository.remove()
	}
}
