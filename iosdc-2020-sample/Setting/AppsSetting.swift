//
//  AppsSetting.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct AppsSetting {
	private init() {}

	static func generate() -> [App] {
		return [
			iOSDCSetting.generate()
		]
	}
}
