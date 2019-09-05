//
//  StringExtensions.swift
//  RxDemo
//
//  Created by maliang on 2019/9/5.
//  Copyright © 2019 maliang. All rights reserved.
//

import UIKit
import CommonCrypto


public extension String {
    
    /// 计算指定字体的尺寸
    ///
    /// - Parameters:
    ///   - font: 字体
    ///   - size: 区域大小
    ///   - lineBreakMode: 换行模式
    /// - Returns: 尺寸
    func size(for font: UIFont, size: CGSize, lineBreakMode: NSLineBreakMode) -> CGSize {
        var attr:[NSAttributedString.Key: Any] = [NSAttributedString.Key.font: font]
        if lineBreakMode != .byWordWrapping {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode
            attr[.paragraphStyle] = paragraphStyle
        }
        let rect = (self as NSString).boundingRect(with: size, options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: attr, context: nil)
        return rect.size
    }
    
    /// 指定字体单行高度
    ///
    /// - Parameter font: 字体
    /// - Returns: 高度
    func height(for font: UIFont) -> CGFloat {
        return size(for: font, size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), lineBreakMode: .byWordWrapping).height
    }
    
    /// 指定字体单行宽度
    ///
    /// - Parameter font: 字体
    /// - Returns: 宽度
    func width(for font: UIFont) -> CGFloat {
        return size(for: font, size: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), lineBreakMode: .byWordWrapping).width
    }
    
    
    
}


