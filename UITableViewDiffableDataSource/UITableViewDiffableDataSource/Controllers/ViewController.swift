//
//  ViewController.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    private var data: [[Shortcut]] = [
        [
            Shortcut(title: "단축어1", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어2", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어3", subTitle: "꿀도 좀 빨아보자")
        ],
        [
            Shortcut(title: "단축어4", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어5", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어6", subTitle: "꿀도 좀 빨아보자")
        ],
        [
            Shortcut(title: "단축어7", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어8", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어9", subTitle: "꿀도 좀 빨아보자")
        ],
    ]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShortcutTableViewCell.id, for: indexPath) as? ShortcutTableViewCell else { return UITableViewCell() }
        cell.config(with: data[indexPath.section][indexPath.row])
        return cell
    }
}
