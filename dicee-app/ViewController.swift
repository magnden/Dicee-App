//
//  ViewController.swift
//  dicee-app
//
//  Created by Dennis Magnusson on 09/09/2017.
//  Copyright © 2017 Dennis Magnusson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0

    let diceImages = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    var rollSound: AVAudioPlayer!
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateDiceImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
   
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        updateDiceImages()
        // Setup Sound
        if let soundURL = Bundle.main.url(forResource: "roll", withExtension: "wav"){
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            // Play Sound
            AudioServicesPlaySystemSound(mySound)
        }
        
    }
    
    func updateDiceImages(){
    
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceImages[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceImages[randomDiceIndex2])
        
    }
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
}

