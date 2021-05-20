//
//  LyricsViewController.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 20/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//


import Cocoa

class LyricsViewController: NSViewController {
    
    @IBOutlet weak var trackTitleView: NSTextField!
    @IBOutlet weak var trackLyricsView: NSTextField!
    @IBOutlet weak var trackProgressView: NSProgressIndicator!
    
    var nowPlayingTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    override func viewWillAppear() {
        startTimer()
    }
    
    override func viewWillDisappear() {
        stopTimer()
    }
    
    @objc private func checkNowPlaying(_: Timer) {
        if let nowPlayingTrack = SpotifyHelpers.getNowPlaying() {
            if
                nowPlayingTrack.title != "" &&
                    nowPlayingTrack.title != self.trackTitleView.stringValue {
                self.loadTrack(track: nowPlayingTrack)
            }
        } else {
            self.spotifyIsNotRunning()
        }
    }
    
    func spotifyIsNotRunning() {
        self.setTrackTitle(title: "Spotify is not running!")
        self.setTrackLyrics(lyrics: "")
    }
    
    func setTrackTitle(title: String) {
        self.trackTitleView.stringValue = title
        self.trackTitleView.isHidden = false
    }
    
    func setTrackLyrics(lyrics: String) {
        self.trackLyricsView.stringValue = lyrics
        self.trackLyricsView.isHidden = false
    }
    
    func loadTrack(track: Track) {
        self.setTrackTitle(title: track.title)
        track.onLyricsChanged = { lyrics in
            self.setTrackLyrics(lyrics: track.lyrics!)
            self.showLyricsView()
        }
        track.loadLyrics()
        self.hideLyricsView()
    }
    
    func showLyricsView() {
        self.trackLyricsView.isHidden = false
        self.trackTitleView.isHidden = false
        trackProgressView.isHidden = true
    }
    
    func hideLyricsView() {
        trackProgressView.isHidden = false
        self.trackLyricsView.isHidden = true
        self.trackTitleView.isHidden = true
    }
    
    func startTimer() {
        if nowPlayingTimer.isValid {
            return
        }
        
        if #available(OSX 10.12, *) {
            nowPlayingTimer = Timer.scheduledTimer(
                withTimeInterval: 4,
                repeats: true,
                block: self.checkNowPlaying
            )
        } else {
            nowPlayingTimer = Timer.scheduledTimer(
                timeInterval: 4,
                target: self,
                selector: #selector(self.checkNowPlaying),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    func stopTimer() {
        if nowPlayingTimer.isValid {
            nowPlayingTimer.invalidate()
        }
    }
}
