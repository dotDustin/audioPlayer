//
//  ViewController.swift
//  audioLesson
//
//  Created by Dustin M on 2/9/16.
//  Copyright © 2016 Vento. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    
    @IBAction func playPressed(sender: AnyObject) {
        
        player.play()
        
    }
    
    @IBAction func pausePressed(sender: AnyObject) {
        
        player.pause()
    
    }
    
    @IBAction func stopPressed(sender: AnyObject) {
    
        player.pause()
        player.currentTime = 0
        
    }
    
    @IBAction func volumeAdjust(sender: AnyObject) {
        
        player.volume = slider.value
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //audioPath is an optional, unwrapped now instead of later
        let audioPath = NSBundle.mainBundle().pathForResource("themesong", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
        }catch{
            
            //Process for errors if try player failes here
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

