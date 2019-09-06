//
//  ItemTableViewCell.swift
//  RxDemo
//
//  Created by maliang on 2019/9/6.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var model:ItemModel {
        set{
            topLabel?.text = newValue.itemTitle
            detailsLabel?.text = newValue.itemDetail
            timeLabel?.text = newValue.itemTime
        }
        get {
            return self.model
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
