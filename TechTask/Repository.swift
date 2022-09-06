//
//  Repository.swift
//  TechTask
//
//  Created by Артем Томило on 5.09.22.
//

import Foundation
import AVFoundation
import MediaPlayer

class Repository {
    
    func createNewSong() -> [Song] {
        var songList: [Song] = []
        
        let firstSong = Song(number: 0, name: "Moth To A Flame", singer: "Swedish House Mafia, The Weekend", poster: UIImage(named: "FirstImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song1", ofType: "mp3")!)))
        let secondSong = Song(number: 1, name: "Darker than blood", singer: "Steve Aoki feat Linkin Park", poster: UIImage(named: "SecondImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song2", ofType: "mp3")!)))
        let thirdSong = Song(number: 2, name: "Still D.R.E.", singer: "Dr. Dre Feat. Snoop Dogg", poster: UIImage(named: "ThirdImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song3", ofType: "mp3")!)))
        
        songList.append(firstSong)
        songList.append(secondSong)
        songList.append(thirdSong)
        
        return songList
    }
}
