//
//  ViewController.swift
//  TechTask
//
//  Created by Артем Томило on 23.08.22.
//

import UIKit
import MediaPlayer
import AVFoundation
import ScalingCarousel

class ViewController: UIViewController {
    
    //MARK: - Property
    
    var player: AVQueuePlayer!
    var items: [AVPlayerItem] = []
    var songsList:[Song] = []
    static let cellIdentifier = "Cell"
    var scalingCarousel: ScalingCarouselView!
    
    //MARK: - IBOutlet
    
    @IBOutlet var firstCircle: UIView!
    @IBOutlet var secondCircle: UIView!
    @IBOutlet var thirdCircle: UIView!
    
    @IBOutlet var textBlock: UIView!
    @IBOutlet var songLabel: UILabel!
    @IBOutlet var singerLabel: UILabel!
    
    @IBOutlet var timeController: UIView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var startTimeLabel: UILabel!
    @IBOutlet var fullSongTimeLabel: UILabel!
    
    @IBOutlet var controlPanel: UIView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var circleView: UIView!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addCarousel()
        
        settingScreen()
        
        settingPlayer()
        
        createNewSong()
        
        displaySongNameAndSingerName()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if scalingCarousel != nil {
            scalingCarousel.deviceRotated()
        }
    }
    
    private func addCarousel() {
        
        let frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        scalingCarousel = ScalingCarouselView(withFrame: frame, andInset: 20)
        scalingCarousel.scrollDirection = .horizontal
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        scalingCarousel.translatesAutoresizingMaskIntoConstraints = false
        scalingCarousel.backgroundColor = .clear
        
        scalingCarousel.register(CustomCell.self, forCellWithReuseIdentifier: ViewController.cellIdentifier)
        
        view.addSubview(scalingCarousel)
        
        NSLayoutConstraint.activate([
            scalingCarousel.widthAnchor.constraint(equalTo: view.widthAnchor),
            scalingCarousel.heightAnchor.constraint(equalToConstant: 309),
            scalingCarousel.topAnchor.constraint(equalTo: view.topAnchor, constant: 101),
        ])
    }
    
    //MARK: - Setting Screen
    
    func settingScreen() {
        circleView.layer.cornerRadius = 40
        circleView.layer.shadowOpacity = 0.50
        circleView.layer.shadowRadius = 50.0
        
        firstCircle.layer.cornerRadius = 107
        secondCircle.layer.cornerRadius = 130
        thirdCircle.layer.cornerRadius = 102
        
        slider.setThumbImage(UIImage(named: "Slider"), for: UIControl.State.normal)
    }
    
    //MARK: - Setting Player
    
    func settingPlayer() {
        player = AVQueuePlayer()
        
        startTimeLabel.font = UIFont(name: "Montserrat Regular", size: 12)
        fullSongTimeLabel.font = UIFont(name: "Montserrat Regular", size: 12)
        
        
        var seconds = 0
        var minutes = 0
        
        player.volume = 0.1
        player.addPeriodicTimeObserver(forInterval: CMTime(seconds: 1, preferredTimescale: 1000), queue: DispatchQueue.main) { time in
            self.slider.value = Float(time.seconds)
            seconds = Int(time.seconds) - (minutes * 60)
            
            switch seconds {
            case 0...9:
                self.startTimeLabel.text = "0\(minutes):0\(seconds)"
            case 10...59:
                self.startTimeLabel.text = "0\(minutes):\(seconds)"
            case 60:
                minutes += 1
                self.startTimeLabel.text = "0\(minutes):00"
            default:
                self.startTimeLabel.text = "0\(minutes):\(seconds)"
            }
            
            self.songTime(player: self.player)
        }
    }
    
    //MARK: - Functions
    
    func songTime(player: AVQueuePlayer) {
        let totalSongTime = Int(self.player.currentItem?.asset.duration.seconds ?? 0)
        let minutesSongTime = totalSongTime / 60
        let secondsSongTime = totalSongTime - minutesSongTime * 60
        fullSongTimeLabel.text = "0\(minutesSongTime):\(secondsSongTime)"
    }
    
    func createNewSong() {
        let firstSong = Song(number: 0, name: "Moth To A Flame (with The Weeknd)", singer: "Swedish House Mafia, The Weeknd", poster: UIImage(named: "FirstImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song1", ofType: "mp3")!)))
        let secondSong = Song(number: 1, name: "Darker than blood", singer: "Steve Aoki feat Linkin Park", poster: UIImage(named: "SecondImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song2", ofType: "mp3")!)))
        let thirdSong = Song(number: 2, name: "Still D.R.E.", singer: "Dr. Dre Feat. Snoop Dogg", poster: UIImage(named: "ThirdImage"), item: AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "song3", ofType: "mp3")!)))
        player.insert(firstSong.item, after: nil)
        player.insert(secondSong.item, after: firstSong.item)
        player.insert(thirdSong.item, after: secondSong.item)
        
        songsList.append(firstSong)
        songsList.append(secondSong)
        songsList.append(thirdSong)
        
        items = player.items()
        
        slider.maximumValue = Float(player.currentItem?.asset.duration.seconds ?? 0)
        
        songTime(player: player)
    }
    
    func displaySongNameAndSingerName() {
        for s in songsList {
            if s.item == player.currentItem {
                songLabel.text = s.name
                singerLabel.text = s.singer
                
                songLabel.font = UIFont(name: "Montserrat SemiBold", size: 20)
                songLabel.textColor = .white
                singerLabel.font = UIFont(name: "Montserrat Regular", size: 14)
                singerLabel.textColor = UIColor(named: "SongTime")
            }
        }
    }
    
    func play(at index: Int) {
        player.removeAllItems()
        let playerItem: AVPlayerItem = items[index]
        playerItem.seek(to: CMTime.zero, completionHandler: nil)
        player.insert(playerItem, after: nil)
        player.play()
    }
    
    func playOrPause() {
        if player.timeControlStatus == .playing {
            player.pause()
            playButton.playImage()
        } else {
            player.play()
            playButton.pauseImage()
        }
    }
    
    func nextSong() {
        var index =  items.firstIndex(of: player.currentItem!) ?? 0
        if index < (items.count - 1) {
            index = index + 1
            play(at: index)
            playButton.pauseImage()
        } else if index == items.count - 1 {
            player.pause()
            player.seek(to: CMTime(seconds: 0, preferredTimescale: 1000))
            playButton.playImage()
        }
        displaySongNameAndSingerName()
        scalingCarousel.scrollToItem(at: IndexPath(item: index, section: 0), at: .right, animated: true)
    }
    
    func previousSong() {
        var index =  items.firstIndex(of: player.currentItem!) ?? 0
        if index > 0 {
            index = index - 1
            play(at: index)
            playButton.pauseImage()
        } else if index == 0 {
            player.pause()
            player.seek(to: CMTime(seconds: 0, preferredTimescale: 1000))
            playButton.playImage()
        }
        displaySongNameAndSingerName()
        scalingCarousel.scrollToItem(at: IndexPath(item: index, section: 0), at: .left, animated: true)
    }
    
    //MARK: - IBAction
    
    @IBAction func startPlay(_ sender: UIButton) {
        playOrPause()
    }
    
    @IBAction func nextSong(_ sender: UIButton) {
        nextSong()
    }
    
    @IBAction func previuosSong(_ sender: UIButton) {
        previousSong()
    }
    
    @IBAction func sliderFunc(_ sender: UISlider) {
        player.seek(to: CMTime(seconds: Double(slider.value), preferredTimescale: 1000))
    }
}
