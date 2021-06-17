//
//  UITableViewCell+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension UITableViewCell {
    
    //返回cell所在的UITableView
    public func superTableView() -> UITableView? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let tableView = view as? UITableView {
                return tableView
            }
        }
        return nil
    }
}
