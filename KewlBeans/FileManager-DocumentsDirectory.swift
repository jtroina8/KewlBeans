//
//  FileManager-DocumentsDirectory.swift
//  KewlBeans
//
//  Created by admin on 2/5/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
