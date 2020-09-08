//
//  SelectorObservableField.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import Foundation

struct SelectorObservableField {
	enum FieldType {
		case bool(key: String, selectedValue: Bool)
		case string(key: String, selectedValue: String)
	}

	let title: String
	let type: FieldType
}
