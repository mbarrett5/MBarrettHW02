//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Michael Barrett on 1/10/17.
//  Copyright © 2017 Michael Barrett. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var awesomeImage: UIImageView!
    
    @IBOutlet weak var switchSlider: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
    
    var lastIndex = -1
    
    let numOfImages = 8
    
    var lastImage = -1
    
    let numOfSounds = 5
    
    var lastSound = -1

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func playSound(soundName: String) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                print("ERROR: data from \(soundName) could not be played as an audio file")
                
            }
            
        } else {
            print("ERROR: could not load data from file \(soundName)")
        }
        
        
    }
    
    func nonRepeatedRandom(last: inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
            
        }
        
        last = random

        
        return random
    }
    
    

    
    
    //MARK: Actions
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        let messages = ["You Are Fantastic",
                        "You Are Great!",
                        "You are amazing!",
                        "You are awesome!",
                        "When the genius bar needs help, they call you",
                        "You brighten my day",
                        "I can't wait to use your app"]
        
        var random: Int
        
        random = nonRepeatedRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]
        
        random = nonRepeatedRandom(last: &lastImage, range: numOfImages)
        awesomeImage.isHidden = false
        awesomeImage.image = UIImage(named: "Image\(random)")
        
        if switchSlider.isOn {
            
            random = nonRepeatedRandom(last: &lastSound, range: numOfSounds)
            playSound(soundName: "sound\(random)")
        }
        
    }
    
    
    @IBAction func slideSwitch(_ sender: UISwitch) {
        if switchSlider.isOn == false {
            if lastSound != -1 {
                awesomePlayer.stop()
            }
            
        }
        
    }
    
        
        
        /*messageLabel.text = messages[index]
        
        if index == messages.count - 1 {
            index = 0
        }
        else {
            index = index + 1
        }*/
    
        
        }
    


