//
//  ViewController.swift
//  colorMatching
//
//  Created by Anika Morris on 11/20/19.
//  Copyright © 2019 Anika Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var timeBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var scoreNavigationItem: UINavigationItem!
    @IBOutlet weak var playBarButtonItem: UIBarButtonItem!
    
    var score: Int = 0
    var counter: Int = 10
    var starting: Bool = true
    var playing: Bool = false
    
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
        // Playing with background gradients
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.bounds
//        gradientLayer.colors = [UIColor.magenta.cgColor,
//                                UIColor.cyan.cgColor]
//
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        wordLabel.clipsToBounds = true
        colorLabel.clipsToBounds = true
        
        wordLabel.layer.cornerRadius = 10.0
        colorLabel.layer.cornerRadius = 10.0
        
        yesButton.layer.cornerRadius = 5.0
        noButton.layer.cornerRadius = 5.0
        
        timeBarButtonItem.title = "Time: 1:00"
        
        setLabels()

    }
    
    
    func runTimer() {
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        //example functionality
        if counter >= 10 {
            timeBarButtonItem.title = "Time: 0:\(counter)"
            // timeLabel.text = "Time: 0:\(counter)"
            counter -= 1
        } else if counter >= 0 {
            timeBarButtonItem.title = "Time: 0:0\(counter)"
            // timeLabel.text = "Time: 0:0\(counter)"
            counter -= 1
        }
    }

    @IBAction func yesButtonTapped(_ sender: Any) {
        // color1 in wordLabel matches color2 in colorLabel
        if playing && counter >= 0 {
            if colorMatches() {
                score += 10
            } else {
                score -= 10
            }
            setLabels()
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        // color1 in wordLabel doesn't match color2 in colorLabel
        if playing && counter >= 0 {
            if !(colorMatches()) {
                score += 10
            } else {
                score -= 10
            }
            setLabels()
        }
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        if starting {
            starting = false
            runTimer()
        }
        
        if playing {
            playing = false
        } else {
            playing = true
        }
        
        if timeBarButtonItem.title == "Time: 0:00" {
            timeBarButtonItem.title = "Time: 1:00"
            playing = true
            counter = 59
            score = 0
            setLabels()
            runTimer()
        }
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
        scoreNavigationItem.title = "Score: \(score)"
        // scoreLabel.text = "Score: \(score)"
    }
    
    func colorMatches() -> Bool {
        return wordLabel.text == colorLabel.textColor.name!
    }

}
