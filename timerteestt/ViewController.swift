//
//  ViewController.swift
//  timerteestt
//
//  Created by Islam Dzhabrailov on 9/28/18.
//  Copyright © 2018 Islam Dzhabrailov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    
    var timer = Timer()
    var counter = 0.0
    var isRuning = false
    
    override func viewDidLoad() {
        
    
        super.viewDidLoad()
        
        timeLabel.text = "\(counter)"
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    }

    @IBAction func resetButtonDidTouch(_ sender: Any)
    {
        timer.invalidate()
        isRuning = false
        counter = 0
        timeLabel.text = "\(counter)"
        playButton.isEnabled = true
        pauseButton.isEnabled = false
    
   
        
    }
    
    @IBAction func playButtonDidTouch(_ sender: Any)
    {
        if !isRuning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
            
            playButton.isEnabled = false
            pauseButton.isEnabled = true
            isRuning = true
            
        }
    }
   
    @IBAction func pauseButtonDidTouch(_ sender: Any)
    {
        playButton.isEnabled = true
        pauseButton.isEnabled = false
        timer.invalidate()
        isRuning = false
        
    }


    @objc func updateTimer(){
        counter += 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }
}


