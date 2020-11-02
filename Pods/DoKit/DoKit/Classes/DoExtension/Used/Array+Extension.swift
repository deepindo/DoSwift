//
//  Array+Extension.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/4.
//  Copyright © 2020 deepin do. All rights reserved.
//

import Foundation

extension Array {

    //Array方法扩展，支持根据索引数组删除
    mutating func removeAt(indexes: [Int]) {
        for i in indexes.sorted(by: >) {
            self.remove(at: i)
        }
    }
}
