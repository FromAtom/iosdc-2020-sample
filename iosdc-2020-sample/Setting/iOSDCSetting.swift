//
//  iOSDCSetting.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct iOSDCSetting {
	private init() {}

	enum Keys: String {
		case isDebugMode
		case changeAPI
		case apiEndpoint
		case featureFlagA
		case featureFlagB
		case featureFlagC
	}

	static func generate() -> App {
		let app = App(name: "iOSDC Japan 2020", bundleID: "net.pixiv.sketch")


		let debugModeGroup = Group(title: "DEBUG", selectors: [
			BoolSelector(key: Keys.isDebugMode.rawValue, title: "デバッグモード")
		])
		app.add(group: debugModeGroup)

		let apiGroup = Group(title: "API", selectors: [
			BoolSelector(key: Keys.changeAPI.rawValue, title: "接続先APIを差し替える"),
			StringSelector(key: Keys.apiEndpoint.rawValue, title: "接続先API", values: [
				"https://example.com/api",
				"https://example.com/sandbox-api",
				"https://example.com/staging-api",
			])
		])
		app.add(group: apiGroup)

		let featureGroup = Group(title: "FEATURE", selectors: [
			BoolSelector(key: Keys.featureFlagA.rawValue, title: "新機能Aを有効化"),
			BoolSelector(key: Keys.featureFlagB.rawValue, title: "新機能Bを有効化"),
			BoolSelector(key: Keys.featureFlagC.rawValue, title: "新機能Cを有効化"),
		])
		app.add(group: featureGroup)


		return app
	}
}
