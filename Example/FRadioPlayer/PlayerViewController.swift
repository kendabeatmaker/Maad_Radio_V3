
import UIKit
import MediaPlayer
import FRadioPlayer


class PlayerViewController: UIViewController {
    
    // IB UI
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak public var statusLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var infoContainer: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var volumeSliderOutlet: UISlider!
    
    // Singleton ref to player
    let player: FRadioPlayer = FRadioPlayer.shared
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MAAD 97.5 FM"
        
        func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
            print("testtt")
        }
     
        //player.radioURL = URL(string: "https://streaming.broadcastradio.com:8872/maad975fm")

        // Set the delegate for the radio player
        player.delegate = self
        
        // Show current player state
        statusLabel.text = player.state.description

      let playImage = #imageLiteral(resourceName: "play")
      let stopImage = #imageLiteral(resourceName: "pause")
        if player.isPlaying {
            playButton.setImage(stopImage, for: UIControl.State.normal)
        } else {
            playButton.setImage(playImage, for: UIControl.State.normal)
        }
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
        let playImage = #imageLiteral(resourceName: "play")
        let stopImage = #imageLiteral(resourceName: "pause")
        if player.isPlaying {
        
            playButton.setImage(stopImage, for: UIControl.State.normal)
        } else {
            playButton.setImage(playImage, for: UIControl.State.normal)
        }
    
    }
    

}

// MARK: - FRadioPlayerDelegate

extension PlayerViewController: FRadioPlayerDelegate {

    func radioPlayer(_ player: FRadioPlayer, playerStateDidChange state: FRadioPlayerState) {
        statusLabel.text = state.description
    }
    
    func radioPlayer(_ player: FRadioPlayer, playbackStateDidChange state: FRadioPlaybackState) {
        playButton.isSelected = player.isPlaying
    }
    

}


// MARK: - Remote Controls / Lock screen

extension PlayerViewController {
    
    func setupRemoteTransportControls() {

        let commandCenter = MPRemoteCommandCenter.shared()

        commandCenter.playCommand.addTarget { [unowned self] event in
            
            if self.player.rate == 0.0 {
                self.player.volume = 0.5
                self.player.play()
                return .success
            }
            return .commandFailed
        }

        commandCenter.pauseCommand.addTarget { [unowned self] event in
            if self.player.rate == 1.0 {
                self.player.pause()
                return .success
            }
            return .commandFailed
        }
        

    }
    
    func updateNowPlaying(with track: Track?) {
    
        // Define Now Playing Info
        var nowPlayingInfo = [String : Any]()
        
        if let artist = track?.artist {
            nowPlayingInfo[MPMediaItemPropertyArtist] = artist
        }
        

        
        // Set the metadata
        MPNowPlayingInfoCenter.default().nowPlayingInfo = nowPlayingInfo
    }
}

// MARK: - UINavigationController

extension UINavigationController {
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // function to handle rotation detection
    

    
}



