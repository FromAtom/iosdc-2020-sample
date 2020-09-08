//
//  StringSelectorTableViewCell.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import UIKit

protocol StringSelectorTableViewCellDelegate: class {
	func changeButtonTouchUpInside(key: String, sender: UITableViewCell)
}

final class StringSelectorTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var valueLabel: UILabel!

	weak var delegate: StringSelectorTableViewCellDelegate?

	private var key: String!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	override func prepareForReuse() {
		super.prepareForReuse()

		delegate = nil
	}

	func set(key: String, title: String, selectedValue: String) {
		self.key = key

		titleLabel.text = title
		valueLabel.text = selectedValue.isEmpty ? "未設定" : selectedValue
	}

	@IBAction func changeButtonTouchUpInside(_ sender: UIButton) {
		delegate?.changeButtonTouchUpInside(key: key, sender: self)
	}
}
