//
//  UITableView+Extension.swift
//  MCHT
//
//  Created by mac on 2019/12/6.
//  Copyright © 2019 deepindo. All rights reserved.
//

import Foundation

extension UITableView {
    
    public func adaptiveTableViewiOS11() {
        if #available(iOS 11, *) {
            self.contentInsetAdjustmentBehavior = .never
            self.estimatedRowHeight = 0
            self.estimatedSectionHeaderHeight = 0
            self.estimatedSectionFooterHeight = 0
        }
    }
}
