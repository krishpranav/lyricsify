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
    
    public static func getSomethingOfCurrentTrack(thing: String) -> String {
        return tellSpotify(
            command: "\(thing) of current track"
            ).replacingOccurrences(
                of: "\n", with: ""
        )
    }
    
    public static func getNowPlaying() -> Track? {
        if self.isSpotifyRunning() {
            return Track()
        }
        return nil
    }
    
    public static func isSpotifyRunning() -> Bool {
        return Helpers.excuteAppleScript(script: "application \"Spotify\" is running") == "true"
    }
}
