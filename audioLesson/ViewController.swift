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
    @IBOutlet var scrubSlider: UISlider!
    @IBOutlet var scrubLabel: UILabel!
    
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
    
    @IBAction func scrubMoved(sender: AnyObject) {
    
        player.currentTime = NSTimeInterval(scrubSlider.value)
        
    }
    
    func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
        return ((seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func updateScrubSlider() {
        
        scrubSlider.value = Float(player.currentTime)
        
        var playTime = Int(scrubSlider.value)
        scrubLabel.text = "\(secondsToMinutesSeconds(playTime))"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrubSlider.setThumbImage(UIImage(named: "triangle"), forState: .Normal)
        
        //audioPath is an optional, unwrapped now instead of later
        let audioPath = NSBundle.mainBundle().pathForResource("themesong", ofType: "mp3")!
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            
            scrubSlider.maximumValue = Float(player.duration)
            scrubSlider.minimumValue = 0.0
            
            _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateScrubSlider"), userInfo: nil, repeats: true)
            
        }catch{
            
            //Process for errors if try player failes here
            
        }
        
        //scrubLabel.text =
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

