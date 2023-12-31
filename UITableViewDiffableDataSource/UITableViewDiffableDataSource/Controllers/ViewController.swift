//
//  ViewController.swift
//  UITableViewDiffableDataSource
//
//  Created by 이지원 on 2023/07/30.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section: CaseIterable {
        case category
        case popular
        case latest
        
        var headerTitle: String {
            switch self {
            case .category:
                return "카테고리 별 단축어"
            case .popular:
                return "인기있는 단축어"
            case .latest:
                return "최신 단축어"
            }
        }
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, Shortcut>!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        setSnapshot()
        
    }
    
    private func setupDataSource() {
        
        dataSource = UITableViewDiffableDataSource<Section, Shortcut>(tableView: tableView) { tableView, indexPath, item in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ShortcutTableViewCell.id, for: indexPath) as? ShortcutTableViewCell else { return UITableViewCell() }
            cell.config(with: item)
            return cell
        }
    }
    
    private func setSnapshot()  {
        let category = [
            Shortcut(title: "단축어1", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어2", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어3", subTitle: "꿀도 좀 빨아보자")
        ]
        
        let popular = [
            Shortcut(title: "단축어4", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어5", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어6", subTitle: "꿀도 좀 빨아보자")
        ]
        
        let latest = [
            Shortcut(title: "단축어7", subTitle: "단축어를 써보세요"),
            Shortcut(title: "단축어8", subTitle: "쉽게 써 보자"),
            Shortcut(title: "단축어9", subTitle: "꿀도 좀 빨아보자")
        ]
        
        var snapshot = dataSource.snapshot()
        snapshot.appendSections([.category, .latest, .popular])
        snapshot.appendItems(category, toSection: .category)
        snapshot.appendItems(popular, toSection: .popular)
        snapshot.appendItems(latest, toSection: .latest)
        dataSource.apply(snapshot)
    }
    
    /// 랜덤 section에 단축어 추가
    @IBAction func didTappedAddShortcut(_ sender: UIButton) {
        let section = Section.allCases.randomElement() ?? .category
        var snapshot = dataSource.snapshot()
        let newShortcut = Shortcut(title: "단축어", subTitle: "새로운 단축어가 추가됐습니다.")
        snapshot.appendItems([newShortcut], toSection: section)
        dataSource.apply(snapshot)
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        guard let shortcut = dataSource.itemIdentifier(for: indexPath) else { return nil }
        let action = UIContextualAction(style: .destructive, title: nil) { (action, view, success: @escaping (Bool) -> Void) in
            var snapshot = self.dataSource.snapshot()
            snapshot.deleteItems([shortcut])
            self.dataSource.apply(snapshot)
        }
        action.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [action])
    }
}
