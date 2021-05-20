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
}
