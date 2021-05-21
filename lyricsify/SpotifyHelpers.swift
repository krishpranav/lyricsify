//
//  SpotifyHelpers.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 21/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

class SpotifyHelpers {
    private static func tellSpotify(command: String) -> String {
        let response = Helpers.excuteAppleScript(
            script: "tell application \"Spotify\" to \(command) as string"
        )
        return response
    }
}
