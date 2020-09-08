//
//  BoolSelectorTableViewCell.swift
//  iosdc-2020-sample
//
//  Created by FromAtom on 2020/09/08.
//  Copyright © 2020 FromAtom. All rights reserved.
//

import UIKit

protocol BoolSelectorTableViewCellDelegate: class {
	func didChangeSwitchValue(key: String, value: Bool)
}

final class BoolSelectorTableViewCell: UITableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var settingSwitch: UISwitch!

	weak var delegate: BoolSelectorTableViewCellDelegate?

	private var key: String!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	override func prepareForReuse() {
		super.prepareForReuse()

		delegate = nil
	}

	func set(key: String, title: String, value: Bool) {
		self.key = key
		titleLabel.text = title
		settingSwitch.isOn = value
	}

	@IBAction func switchValueChanged(_ sender: UISwitch) {
		delegate?.didChangeSwitchValue(key: key, value: sender.isOn)
	}
}
