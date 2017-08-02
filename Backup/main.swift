//
//  main.swift
//  Backup
//
//  Created by Ezekiel Elin on 8/2/17.
//  Copyright © 2017 Ezekiel Elin. All rights reserved.
//

import Foundation

let fileManager = FileManager.default
let backupdir = URL(fileURLWithPath: "/Users/ezekielelin/Backups/", isDirectory: true)

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let dateString = dateFormatter.string(from: Date())

for argument in CommandLine.arguments {
    let fileURL = URL(fileURLWithPath: argument)
    let uid = UUID().description
    let destinationFolder = backupdir.appendingPathComponent("\(dateString)/\(uid)")

    try fileManager.createDirectory(at: destinationFolder, withIntermediateDirectories: true)
    
    let filename = "\(fileURL.lastPathComponent)"
    
    let destinationURL = destinationFolder.appendingPathComponent("\(filename)")
    
    try fileManager.copyItem(at: fileURL, to: destinationURL)
}
