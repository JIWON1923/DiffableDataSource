//
//  Shortcut.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/31.
//

import Foundation

struct Shortcut: Hashable {
    let id: String?
    let title: String?
    let subTitle: String?
    private(set) var isLiked: Bool = false
    
    init(title: String?, subTitle: String?) {
        self.id = UUID().uuidString
        self.title = title
        self.subTitle = subTitle
    }
    
    mutating func toggleIsLiked() {
        self.isLiked.toggle()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
