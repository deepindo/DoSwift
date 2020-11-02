//
//  URL+DD.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/14.
//  Copyright © 2020 deepin do. All rights reserved.
//

import UIKit

public extension URL {
    
    /// Documents目录Url
    static var documentsDirectoryUrl: URL {
        return try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    /// Caches目录Url
    static var cachesDirectoryUrl: URL {
        return try! FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    /// Library目录Url
    static var libraryDirectoryUrl: URL {
        return try! FileManager.default.url(for: .libraryDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    /// tmp目录Url
    static var tmpDirectorUrl: URL {
        return URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true)
    }
}
