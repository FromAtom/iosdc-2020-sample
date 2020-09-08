//
//  Instantiatable.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import UIKit

protocol Instantiatable {
	associatedtype ViewModelType
	var viewModel: ViewModelType! { get set }
	static var storyboardName: String { get }
}

extension Instantiatable where Self: UIViewController {
	static var storyboardName: String {
		return ""
	}

	private static var _storyboardName: String {
		if storyboardName.isEmpty {
			return className
		} else {
			return storyboardName
		}
	}

	private static var storyboard: UIStoryboard {
		return UIStoryboard.init(name: _storyboardName, bundle: nil)
	}

	private static var className: String {
		return String(describing: Self.self)
	}

	static func instantiateFromStoryboard(viewModel: ViewModelType) -> Self {
		guard var vc = storyboard.instantiateInitialViewController() as? Self else {
			fatalError("Can no instantiate \(Self.className) from \(_storyboardName).storyboard")
		}
		vc.viewModel = viewModel
		return vc
	}
}
