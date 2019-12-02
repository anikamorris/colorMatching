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
        
    }

    @IBAction func yesButtonTapped(_ sender: Any) {
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
    }
    
    func setTextColors() {
        // Get a random color
        let color1 = randomColor()
        // Set wordLabel text to random color
        wordLabel.text = whichColor(color: color1)
        // Get another random color
        let color2 = randomColor()
        // Set wordLabel text color to random color
        wordLabel.textColor = color2.rawValue
        // Do the same for colorLabel
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

}
