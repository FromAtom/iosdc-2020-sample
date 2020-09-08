//
//  BoolSettingRepository.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct BoolSettingRepository: SettingRepository {
	typealias T = Bool
	let bundleID: String
	let key: String
}
