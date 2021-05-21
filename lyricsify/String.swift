//
//  String.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 21/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

extension String {
    func stripHtml() -> String {
        let htmlReplaceString = "<[^>]+>"
        return self.replacingOccurrences(
            of: htmlReplaceString,
            with: "",
            options: String.CompareOptions.regularExpression,
            range: nil
        )
    }
    
    func breakToNewLine() -> String {
        return self.replacingOccurrences(of: "<br>", with: "\n")
    }
}
