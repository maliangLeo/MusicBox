//
//  AddNewItemController.swift
//  RxDemo
//
//  Created by maliang on 2019/9/6.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

protocol AddDelegate:NSObjectProtocol {
    func addItemByDelegate(item:ItemModel)
}


class AddNewItemController: UIViewController {
    
    var delegate:AddDelegate?
    
    var model: ItemModel?
    
    var titleTf: UITextField?
    var detailTf: UITextField?
    var timeTf: UITextField?
    var saveButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.navigationItem.title = "Title"
        
        self.titleTf = UITextField(frame: CGRect(x: 101, y: 50, width: 160, height: 30))
        self.titleTf?.placeholder = "输入Title"
        self.titleTf?.borderStyle = .roundedRect
        self.view.addSubview(self.titleTf!)
        
        self.detailTf = UITextField(frame: CGRect(x: 101, y: 143, width: 160, height: 93))
        self.detailTf?.placeholder = "输入detail"
        self.detailTf?.borderStyle = .roundedRect
        self.view.addSubview(self.detailTf!)
        
        self.timeTf = UITextField(frame: CGRect(x: 101, y: 293, width: 160, height: 30))
        self.timeTf?.placeholder = "选择时间"
        self.timeTf?.borderStyle = .roundedRect
        self.view.addSubview(self.timeTf!)
        
        self.saveButton = UIButton(frame: CGRect(x: 132, y: 400, width: 98, height: 38))
        self.saveButton?.addTarget(self, action: #selector(saveItem), for: .touchUpInside)
        self.saveButton?.setTitle("Save", for: .normal)
        self.saveButton?.setTitleColor(UIColor.white, for: .normal)
        self.saveButton?.backgroundColor = UIColor("009688")
        self.saveButton?.layer.cornerRadius = 2.0
        self.view.addSubview(self.saveButton!)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func saveItem()  {
        if self.titleTf?.text?.count==0 || self.detailTf?.text?.count==0 || self.timeTf?.text?.count==0 {
            showAlert(title: "提示", message: "请填写完整信息")
            return
        }
        let title = self.titleTf?.text
        let detail = self.detailTf?.text
        let time = self.timeTf?.text
        
        self.model = ItemModel(itemTitle: title!, itemDetail: detail!, itemTime: time!)
        self.delegate?.addItemByDelegate(item: model!)
        self.navigationController?.popViewController(animated: true)
    }
    
    //显示消息
    func showAlert(title:String, message:String){
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
