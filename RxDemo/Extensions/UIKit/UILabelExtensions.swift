//
//  UILabelExtensions.swift
//  RxDemo
//
//  Created by maliang on 2019/9/5.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit

public extension UILabel {
    
    convenience init(text: String, font: UIFont) {
        self.init()
        self.font = font
        self.text = text
    }
    
}

public extension UILabel {
    ///返回label高度
    func labelHeight(fitWidth: CGFloat) -> CGFloat {
        guard let str: NSString = self.text as NSString? else {
            return 0
        }
        let size = str.boundingRect(with: CGSize(width: fitWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [.font: self.font!], context: nil)
        return size.height
    }
}

