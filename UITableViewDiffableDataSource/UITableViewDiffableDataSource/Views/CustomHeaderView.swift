//
//  CustomHeaderView.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/31.
//

import UIKit

final class CustomHeaderView: UITableViewCell {
    static let id = "CustomHeaderView"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(title: String) {
        self.titleLabel.text = title
    }
}
