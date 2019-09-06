//
//  MineZoneViewController.swift
//  RxDemo
//
//  Created by maliang on 2019/9/5.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MineZoneViewController: UIViewController,AddDelegate {
    
    var tableView:UITableView!
    let disposeBag = DisposeBag()
    
    var userItems = [ItemModel(itemTitle: "shangban", itemDetail: "detail", itemTime: "2019-4-4"),
                     ItemModel(itemTitle: "shangban", itemDetail: "detail", itemTime: "2019-4-5"),
                     ItemModel(itemTitle: "shangban", itemDetail: "detail", itemTime: "2019-4-6"),
                     ItemModel(itemTitle: "shangban", itemDetail: "detail", itemTime: "2019-4-7")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Edit Mode Title"
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addItem))
        
        
        self.tableView = UITableView(frame: self.view.frame, style: .plain)
        self.tableView.register(UINib.init(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(self.tableView)
        
    }
    
    func addItemByDelegate(item: ItemModel) {
        self.userItems.append(item)
        self.tableView.reloadData()
    }
    
    
    @objc func addItem() {
        let addVC = AddNewItemController()
        addVC.delegate = self
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
}

extension MineZoneViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ItemTableViewCell"
        var cell : ItemTableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ItemTableViewCell
        if cell == nil {
            cell = ItemTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell.model = userItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailViewController()
        detailVC.model = userItems[indexPath.row]
        detailVC.itemBlock = {(item:ItemModel) in
            self.userItems.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
}
