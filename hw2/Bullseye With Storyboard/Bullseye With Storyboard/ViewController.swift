//
//  ViewController.swift
//  Storyboard Bullseye
//
//  Created by Chae Won Yun on 1/13/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
 
    var randomNumber = 0
    var range = 100
    var level = 1
    var highScoreNum = 0
    
    @IBOutlet weak var exactSwitch: UISwitch!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var numLabel: UILabel!
    
    @IBOutlet weak var currentLevel: UILabel!
    
    @IBOutlet weak var highScore: UILabel!
    
    @IBOutlet weak var numSlider: UISlider!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var rangeLabel: UILabel!
    
    @IBAction func checkValue(_ sender: Any) {
        if exactSwitch.isOn == false {
            if randomNumber - 3 <= Int(numSlider.value) && randomNumber + 3 >= Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                
                level += 1
                currentLevel.text = String(level)
    
    
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
                playAgainButton.isHidden = false
           }
       }
        else {
                    if Int(numSlider.value) == randomNumber {
                resultLabel.text = "You were right on point! Bullseye!"
                range += 50
                rangeLabel.text = String(range)
                numSlider.maximumValue = Float(range)
                    
                level += 1
                currentLevel.text = String(level)
                    
                numSlider.setValue(Float(range / 2), animated: false)
                randomNumber = Int(arc4random_uniform(UInt32(range + 1)))
                numLabel.text = String(randomNumber)
                resultLabel.isHidden = true
            } else {
                resultLabel.text = "Whoops! You missed! Try again later"
                playAgainButton.isHidden = false
            }
        }
            
        resultLabel.isHidden = false
    }
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        resultLabel.isHidden = true //must reappear next time it is checked ^
        playAgainButton.isHidden = true
        
        if level > highScoreNum && level != 1 {
            highScoreNum = level
            highScore.text = String(highScoreNum)
        }
        
        // new
        range = 100
        rangeLabel.text = String(range)
        numSlider.maximumValue = Float(range)
        
        level = 1
        currentLevel.text = String(level)
        
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = String(randomNumber)
        rangeLabel.text = String(range)
        currentLevel.text = String(level)
        highScore.text = String(highScoreNum)
    }
 
}


