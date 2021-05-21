//
//  Track.swift
//  lyricsify
//
//  Created by Elangovan Ayyasamy on 21/05/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Kanna

class Track {
    public var artist: String
    public var album:  String
    public var name:   String
    public var lyrics: String?
    public var onLyricsChanged: ((String) -> Void)?
}
