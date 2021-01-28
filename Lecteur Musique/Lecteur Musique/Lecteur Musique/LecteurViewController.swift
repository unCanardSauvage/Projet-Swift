//
//  LecteurViewController.swift
//  Lecteur Musique
//
//  Created by Armand Audeoud on 28/01/2021.
//

import UIKit
import AVFoundation

class LecteurViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let morceau = data {
            titreLabel.text = morceau.titre
            artisteLabel.text = morceau.artiste
            
            let path = Bundle.main.path(forResource: morceau.musique, ofType: "mp3")!
            let url = URL(fileURLWithPath: path)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                //player!.play()
                
            }
            catch {
                print ("ERROR: no MP3 file!")
            }
            //let pathImg = Bundle.main.path(forResource: morceau.image, ofType: "png")!
            //image = UIImageView(image: UIImage(contentsOfFile: pathImg))
            //let fileName = morceau.image + ".png"
            //image =
            
            startMusic()
            
        }
        
        
        
        

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titreLabel: UILabel!
    @IBOutlet weak var artisteLabel: UILabel!
    @IBOutlet weak var startNpauseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
   @objc func updateTimer() {
        if Float(player!.currentTime) <= Float(player!.duration){
            progressBar.progress = (Float(player!.currentTime) - Float(player!.duration) * 100) / Float(player!.duration)
            let current_minute = Int( player!.currentTime / 60)
            let current_second = Int(player!.currentTime) % 60
            
            let total_minute = Int(player!.duration / 60)
            let total_second = Int(player!.duration) % 60
            
            timeLabel.text = String(format: "%i:%i/%i:%i", current_minute, current_second, total_minute, total_second)
            
            print(timeLabel.text!)
        }
        else {
            timer.invalidate()
        }
    }

    @IBAction func playNstop(_ sender: UIButton) {
        if !player!.isPlaying {
            startMusic()
                    }
        else {
            pauseMusic()
        }
    }
    
    func startMusic() {
        print("is playing")
        startNpauseButton.setImage(UIImage(named: "pause"), for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        timer.fire()
        player!.play()
    }
    
    func pauseMusic() {
        startNpauseButton.setImage(UIImage(named: "start"), for: .normal)
        //Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: false)
        timer.invalidate()
        player!.pause()
    }
    
    @IBAction func previousMusic(_ sender: UIButton) {
    }
    
    @IBAction func nextMusic(_ sender: UIButton) {
    }
    var data: Morceau?
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
