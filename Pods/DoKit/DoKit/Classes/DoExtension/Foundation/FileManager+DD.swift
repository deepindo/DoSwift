//
//  FileManager+DD.swift
//  NoWhite
//
//  Created by deepin do on 2020/3/14.
//  Copyright © 2020 deepin do. All rights reserved.
//

import UIKit

public extension FileManager {
    
    static func fileExistInMainBundle(fileName: String) -> Bool {
        return FileManager.default.fileExists(atPath: Bundle.main.bundlePath.appending("/\(fileName)"))
    }
}
