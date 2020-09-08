//
//  BoolSelectorViewModel.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct BoolSelectorViewModel {
	private let selector: BoolSelector
	private let repository: BoolSettingRepository
	var observableField: SelectorObservableField {
		return SelectorObservableField(title: selector.title, type: .bool(key: repository.key, selectedValue: repository.get()))
	}

	init(selector: BoolSelector, bundleID: String) {
		self.selector = selector
		self.repository = BoolSettingRepository(bundleID: bundleID, key: selector.key)
	}

	func update(value: Bool) {
		repository.set(value)
	}

	func remove() {
		repository.remove()
	}
}
