//
//  ShortcutTableViewCell.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/31.
//

import UIKit

final class ShortcutTableViewCell: UITableViewCell {
    static let id = "ShortcutCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func config(with shortcut: Shortcut) {
        titleLabel.text = shortcut.title
        subTitleLabel.text = shortcut.subTitle
    }
}
