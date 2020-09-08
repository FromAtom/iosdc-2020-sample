//
//  Group.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

final class Group {
	let title: String?
	let selectors: [Selector]

	init(title: String? = nil, selectors: [Selector]) {
		self.title = title
		self.selectors = selectors
	}
}
