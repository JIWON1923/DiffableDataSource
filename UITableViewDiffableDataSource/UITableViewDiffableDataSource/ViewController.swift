//
//  ViewController.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    private var data = ["1", "2", "3"]

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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
