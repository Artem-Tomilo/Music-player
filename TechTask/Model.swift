//
//  Model.swift
//  TechTask
//
//  Created by Артем Томило on 3.09.22.
//

import Foundation
import MediaPlayer
import AVFoundation

struct Song {
    var number: Int
    var name: String
    var singer: String
    var poster: UIImage?
    var item: AVPlayerItem
}
