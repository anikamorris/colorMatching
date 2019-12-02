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
        wordLabel.layer.cornerRadius = 10.0
        colorLabel.layer.cornerRadius = 10.0
        yesButton.layer.cornerRadius = 10.0
        noButton.layer.cornerRadius = 10.0
        setLabels()
    }

    @IBAction func yesButtonTapped(_ sender: Any) {
        setLabels()
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        setLabels()
    }
    
    func setTextColors(label: UILabel) {
        // Get a random color
        let color1 = randomColor()
        // Set label text to random color
        label.text = whichColor(color: color1)
        // Get another random color
        let color2 = randomColor()
        // Set label text color to second random color
        label.textColor = color2.rawValue
    }
    
    func randomColor() -> ViewController.Color {
        return Color.allCases.randomElement()!
    }
    
    func whichColor(color: Color) -> String {
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
    }

}
