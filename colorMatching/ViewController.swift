//
//  ViewController.swift
//  colorMatching
//
//  Created by Anika Morris on 11/20/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    var score: Int = 0
    var counter: Int = 59
    
    enum Color: CaseIterable {
        case red
        case orange
        case yellow
        case green
        case blue
        case purple
        case brown
        case black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        wordLabel.clipsToBounds = true
        colorLabel.clipsToBounds = true
        wordLabel.layer.cornerRadius = 10.0
        colorLabel.layer.cornerRadius = 10.0
        yesButton.layer.cornerRadius = 5.0
        noButton.layer.cornerRadius = 5.0
        timeLabel.text = "Time: 1:00"
        
        setLabels()
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter >= 10 {
            timeLabel.text = "Time: 0:\(counter)"
            counter -= 1
        } else if counter >= 0 {
            timeLabel.text = "Time: 0:0\(counter)"
            counter -= 1
        }
    }

    @IBAction func yesButtonTapped(_ sender: Any) {
        // color1 in wordLabel matches color2 in colorLabel
        if colorMatches() {
            score += 10
        } else {
            score -= 10
        }
        setLabels()
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        // color1 in wordLabel doesn't match color2 in colorLabel
        if !(colorMatches()) {
            score += 10
        } else {
            score -= 10
        }
        setLabels()
    }
    
    @IBAction func pauseButtonTapped(_ sender: Any) {
        
    }
    
    func setTextColors(label: UILabel) {
        // Get a random color
        let color1 = randomColor()
        // Set label text to random color
        label.text = whichColorAsString(color: color1)
        // Get another random color
        let color2 = randomColor()
        // Set label text color to second random color
        label.textColor = color2.rawValue
    }
    
    func randomColor() -> ViewController.Color {
        return Color.allCases.randomElement()!
    }
    
    func whichColorAsString(color: Color) -> String {
        switch color {
            case .red: return "red"
            case .orange: return "orange"
            case .yellow: return "yellow"
            case .green: return "green"
            case .blue: return "blue"
            case .purple: return "purple"
            case .brown: return "brown"
            case .black: return "black"
        }
    }
    
    func setLabels() {
        setTextColors(label: wordLabel)
        setTextColors(label: colorLabel)
        scoreLabel.text = "Score: \(score)"
    }
    
    func colorMatches() -> Bool {
        return wordLabel.text == colorLabel.textColor.name!
    }

}
