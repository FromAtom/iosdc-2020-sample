//
//  SettingRepository.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

protocol SettingRepository {
	associatedtype T
	var suiteName: String { get }
	var userDefaults: UserDefaults { get }
	var bundleID: String { get }
	var key: String { get }
	var actualKey: String { get }

	func get() -> T
	func set(_ value: T)
	func remove()
}

extension SettingRepository {
	var suiteName: String {
		// 設定したApp GroupsのIDを返すように書き換えてください。
		// fatalErrorをコメントアウトすれば、UIの確認が可能です。
		fatalError("please set your suite name.")
		return ""
	}

	var userDefaults: UserDefaults {
		return UserDefaults(suiteName: suiteName)!
	}

	var actualKey: String {
		return "\(bundleID)_\(key)"
	}

	func set(_ value: T) {
		userDefaults.set(value, forKey: actualKey)
	}

	func remove() {
		userDefaults.removeObject(forKey: actualKey)
	}
}

extension SettingRepository where T == Bool {
	func get() -> Bool {
		return userDefaults.object(forKey: actualKey) as? Bool ?? false
	}
}

extension SettingRepository where T == String {
	func get() -> String {
		return userDefaults.object(forKey: actualKey) as? String ?? ""
	}
}
