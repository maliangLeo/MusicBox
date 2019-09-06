//
//  ItemModel.swift
//  RxDemo
//
//  Created by maliang on 2019/9/6.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

class ItemModel: NSObject {
    
    var itemTitle: String!
    var itemDetail: String!
    var itemTime: String!
    
    init(itemTitle:String, itemDetail: String, itemTime: String) {
        self.itemTitle = itemTitle
        self.itemDetail = itemDetail
        self.itemTime = itemTime
    }
}
