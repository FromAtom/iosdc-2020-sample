//
//  StringSettingRepository.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct StringSettingRepository: SettingRepository {
	typealias T = String
	let bundleID: String
	let key: String
}
