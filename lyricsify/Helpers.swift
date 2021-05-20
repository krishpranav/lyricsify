//
//  Helpers.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 20/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

import Cocoa

class Helpers {
    public static func executeShellCommand(command: String, args; Array<String>) -> String {
        let pipe = Pipe()
        let process = Process()
        
        process.standardOutput = pipe
        process.launchPath = command
        process.arguments = args
        process.launch()
        
    }
}
