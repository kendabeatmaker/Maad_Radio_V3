//
//  ViewController.swift
//  FRadioPlayerDemo
//
//  Created by Fethi El Hassasna on 2017-11-11.
//  Copyright © 2017 Fethi El Hassasna. All rights reserved.
//

import UIKit
import MediaPlayer
import FRadioPlayer


class ViewController: UIViewController {
    
    // IB UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeSliderOutlet: UISlider!
    
    // Singleton ref to player
    let player: FRadioPlayer = FRadioPlayer.shared
    
    // List of stations
//    let stations = [Station(name: "Newport Folk Radio",
//                            detail: "Are you ready to Folk?",
//                            url: URL(string: "https://streaming.broadcastradio.com:8872/maad975fm")!,
//                            image: #imageLiteral(resourceName: "station2")),
//
//                    Station(name: "Absolute Country Hits Radio",
//                             detail: "The Music Starts Here",
//                             url: URL(string: "http://strm112.1.fm/acountry_mobile_mp3")!,
//                             image: #imageLiteral(resourceName: "station1")),
//
//                     Station(name: "The Alt Vault",
//                             detail: "Your Lifestyle... Your Music!",
//                             url: URL(string: "http://jupiter.prostreaming.net/altmixxlow")!,
//                             image: #imageLiteral(resourceName: "station3"))]
//
    // Selected station index
//    var selectedIndex = 0 {
//        didSet {
//            defer {
//                selectStation(at: selectedIndex)
//                updateNowPlaying(with: track)
//            }
//
//            guard 0..<stations.endIndex ~= selectedIndex else {
//                selectedIndex = selectedIndex < 0 ? stations.count - 1 : 0
//                return
//            }
//        }
//    }
    
//    var track: Track? {
//        didSet {
//            artistLabel.text = track?.artist
//            trackLabel.text = track?.name
//            updateNowPlaying(with: track)
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MAAD 97.5 FM"
        player.radioURL = URL(string: "https://streaming.broadcastradio.com:8872/maad975fm")

        // Set the delegate for the radio player
        player.delegate = self
        
        // Show current player state
        statusLabel.text = player.state.description
        
        //tableView.tableFooterView = UIView()
        //infoContainer.isHidden = true
        
        setupRemoteTransportControls()
       
        //player.volume = 0.0
        volumeSliderOutlet.value = player.volume ?? 0.2
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
      
        
        player.volume = volumeSliderOutlet.value
        
        
        //statusLabel.text = String(format: "%.1f", player.volume!)
        
        
        
        
        
        
    }
    
    
    @IBAction func playTap(_ sender: Any) {
       
        
        player.togglePlaying()
        
    
    }
    
    @IBAction func stopTap(_ sender: Any) {
        player.stop()
    }
    
//    @IBAction func previousTap(_ sender: Any) {
//        previous()
//    }
    
//    @IBAction func nextTap(_ sender: Any) {
//        next()
//    }
//
//    func next() {
//        selectedIndex += 1
//    }
//
//    func previous() {
//        selectedIndex -= 1
//    }
//
    func selectStation(at position: Int) {
        player.radioURL = URL(string: "https://streaming.broadcastradio.com:8872/maad975fm")
        //tableView.selectRow(at: IndexPath(item: position, section: 0), animated: true, scrollPosition: .none)
    }
}

// MARK: - FRadioPlayerDelegate

extension ViewController: FRadioPlayerDelegate {

    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        statusLabel.text = state.description
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
        playButton.isSelected = player.isPlaying
    }
    
//    func radioPlayer(_ player: FRadioPlayer, metadataDidChange artistName: String?, trackName: String?) {
//        track = Track(artist: artistName, name: trackName)
//    }
//
//    func radioPlayer(_ player: FRadioPlayer, itemDidChange url: URL?) {
//        track = nil
//    }
    
//    func radioPlayer(_ player: FRadioPlayer, metadataDidChange rawValue: String?) {
//        infoContainer.isHidden = (rawValue == nil)
//    }
    
//    func radioPlayer(_ player: FRadioPlayer, artworkDidChange artworkURL: URL?) {
//
//        // Please note that the following example is for demonstration purposes only, consider using asynchronous network calls to set the image from a URL.
//        guard let artworkURL = artworkURL, let data = try? Data(contentsOf: artworkURL) else {
//            artworkImageView.image = stations[selectedIndex].image
//            return
//        }
//        track?.image = UIImage(data: data)
//        artworkImageView.image = track?.image
//        updateNowPlaying(with: track)
//    }
}

// MARK: - UITableViewDelegate

//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return stations.count
////    }
//    
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////        cell.textLabel?.text = stations[indexPath.item].name
////        cell.detailTextLabel?.text = stations[indexPath.item].detail
////        cell.imageView?.image = stations[indexPath.item].image
////        return cell
////    }
//    
////    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        selectedIndex = indexPath.item
////    }
//}

// MARK: - Remote Controls / Lock screen

extension ViewController {
    
    func setupRemoteTransportControls() {
        // Get the shared MPRemoteCommandCenter
        let commandCenter = MPRemoteCommandCenter.shared()
        
        // Add handler for Play Command
        commandCenter.playCommand.addTarget { [unowned self] event in
            
            if self.player.rate == 0.0 {
                self.player.volume = 0.5
                self.player.play()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Pause Command
        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
        
        // Add handler for Next Command
//        commandCenter.nextTrackCommand.addTarget { [unowned self] event in
//            self.next()
//            return .success
//        }
        
        // Add handler for Previous Command
//        commandCenter.previousTrackCommand.addTarget { [unowned self] event in
//            self.previous()
//            return .success
//        }
    }
    
    func updateNowPlaying(with track: Track?) {
    
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        
        if let artist = track?.artist {
            nowPlayingInfo[MPMediaItemPropertyArtist] = artist
        }
        
        //nowPlayingInfo[MPMediaItemPropertyTitle] = track?.name ?? stations[selectedIndex].name
        
//        if let image = track?.image ?? stations[selectedIndex].image {
//            nowPlayingInfo[MPMediaItemPropertyArtwork] = MPMediaItemArtwork(boundsSize: image.size, requestHandler: { _ -> UIImage in
//                return image
//            })
//        }
        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}

// MARK: - UINavigationController

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}



