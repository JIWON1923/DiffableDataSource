//
//  Shortcut.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/31.
//

import Foundation

struct Shortcut {
    let id: String?
    let title: String?
    let subTitle: String?
    
    init(title: String?, subTitle: String?) {
        self.id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
    }
}
