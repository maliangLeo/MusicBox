//
//  DetailViewController.swift
//  RxDemo
//
//  Created by maliang on 2019/9/6.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var itemBlock:((_ item:ItemModel) -> Void)?
    
    
    var model: ItemModel?
    
    var titleLabel: UILabel?
    var detailLabel: UILabel?
    var timeLabel: UILabel?
    var deleteBtn: UIButton?
    var doneBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Detail"
        
        self.titleLabel = UILabel(frame: CGRect(x: 12, y: 68, width: 244, height: 42))
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.titleLabel?.textColor = UIColor("333333")
        self.view.addSubview(self.titleLabel!)
        
        self.detailLabel = UILabel(frame: CGRect(x: 12, y: 116, width: 244, height: 22))
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel?.textColor = UIColor("333333")
        self.view.addSubview(self.detailLabel!)
        
        self.timeLabel = UILabel(frame: CGRect(x: 12, y: 141, width: 244, height: 22))
        self.timeLabel?.font = UIFont.systemFont(ofSize: 13)
        self.timeLabel?.textColor = UIColor("666666")
        self.view.addSubview(self.timeLabel!)
        
        self.deleteBtn = UIButton(frame: CGRect(x: 57, y: 333, width: 98, height: 38))
        self.deleteBtn?.setTitle("Delete", for: .normal)
        self.deleteBtn?.backgroundColor = UIColor("999999")?.withAlphaComponent(0.1)
        self.deleteBtn?.setTitleColor(UIColor("009688"), for: .normal)
        self.deleteBtn?.layer.cornerRadius = 2.0
        self.deleteBtn?.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        self.view.addSubview(self.deleteBtn!)
        
        self.doneBtn = UIButton(frame: CGRect(x: 239, y: 333, width: 98, height: 38))
        self.doneBtn?.setTitle("Done", for: .normal)
        self.doneBtn?.addTarget(self, action: #selector(done), for: .touchUpInside)
        self.doneBtn?.setTitleColor(UIColor.white, for: .normal)
        self.doneBtn?.backgroundColor = UIColor("009688")
        self.doneBtn?.layer.cornerRadius = 2.0
        self.view.addSubview(self.doneBtn!)
        
        
        self.titleLabel?.text = model?.itemTitle
        self.detailLabel?.text = model?.itemDetail
        self.timeLabel?.text = model?.itemTime
        // Do any additional setup after loading the view.
    }
    
    
    @objc func deleteItem() {
        let alertController = UIAlertController(title: "确定删除嘛？", message: nil, preferredStyle: .alert)
        let sureAction = UIAlertAction(title: "确定", style: .default) { (sureAction) in
            self.itemBlock?(self.model!)
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(sureAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func done() {
        self.navigationController?.popViewController(animated: true)
    }
        
}
