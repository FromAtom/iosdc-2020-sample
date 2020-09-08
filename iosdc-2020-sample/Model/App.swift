//
//  App.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

final class App {
	let name: String
	let bundleID: String
	var groups: [Group] = []

	init(name: String, bundleID: String) {
		self.name = name
		self.bundleID = bundleID
	}

	func add(group: Group) {
		groups.append(group)
	}
}
