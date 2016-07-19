//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Viktorija Cizevska on 7/4/16.
//  Copyright © 2016 Victoria Cizevska. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    //@IBOutlet weak var timeLabel :UILabel!
    
    
    var recordedAudioURL: NSURL!
    
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    var currentTime:NSTimeInterval!
    var timer:NSTimer!
    
    //Play sound switch statement

    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}

    @IBAction func playSoundForButton (sender: UIButton){
        print("Play Sound Button Pressed")
        switch(ButtonType (rawValue: sender.tag)!) {
        case .Slow:
            playSound(rate:0.5)
        case .Fast:
            playSound(rate:1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound( echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    //Stop Playing function
    @IBAction func stopButtonPRessed( sender: AnyObject){
        print("Stop Audio Button Pressed")
        stopAudio()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        
        print("PlaySOundsVuewcontroller loaded")
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  //  func displayCurrentTime(){
//      let elapsedTime = Int(audioPlayerNode.currentTime)
 //      let minutes = elapsedTime/60
  //     let seconds = elapsedTime-minutes*60
   //   timeLabel.text=NSString(format: "%02D:%02d", minutes, seconds) as String
 //   }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
