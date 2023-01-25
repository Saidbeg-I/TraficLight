//
//  ViewController.swift
//  TraficLight
//
//  Created by 1 on 22.01.2023.
//

import UIKit

enum CurrentColor {
    case red, yellow, green
}

class ViewController: UIViewController {
    
    @IBOutlet var redColorView: UIView!
    @IBOutlet var yellowColorView: UIView!
    @IBOutlet var greenColorView: UIView!
    
    @IBOutlet var startButtonPressed: UIButton!
    
    private var curentLightOf: CGFloat = 0.3
    private var curentLightOn: CGFloat = 1
    
    private var currentLight: CurrentColor = .red
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redColorView.alpha = curentLightOf
        yellowColorView.alpha = curentLightOf
        greenColorView.alpha = curentLightOf
        
        startButtonPressed.layer.cornerRadius = 10
        startButtonPressed.configuration = setUpButton(with: "Start")
        
        
    }
    
    override func viewWillLayoutSubviews() {
        redColorView.layer.cornerRadius = redColorView.frame.width/2
        yellowColorView.layer.cornerRadius = yellowColorView.frame.width/2
        greenColorView.layer.cornerRadius = greenColorView.frame.width/2
    }
    
    @IBAction func nextButtonPressed(){
        if startButtonPressed.currentTitle == "Text" {
            startButtonPressed.setTitle("Next", for: .normal)
        }
        switch currentLight {
            
        case .red:
            redColorView.alpha = curentLightOn
            greenColorView.alpha = curentLightOf
            currentLight = .yellow
        case .yellow:
            redColorView.alpha = curentLightOf
            yellowColorView.alpha = curentLightOn
            currentLight = .green
        case .green:
            yellowColorView.alpha = curentLightOf
            greenColorView.alpha = curentLightOn
            currentLight = .red
        }
        
    }
//        if redColorView.alpha == 1 {
//            yellowColorView.alpha = curentLightOn
//            redColorView.alpha = curentLightOf
//        } else if yellowColorView.alpha == 1 {
//            yellowColorView.alpha = curentLightOf
//            greenColorView.alpha = curentLightOn
//        } else if greenColorView.alpha == 1 {
//            redColorView.alpha = curentLightOn
//            greenColorView.alpha = curentLightOf
//        } else {
//            redColorView.alpha = curentLightOn
//        }
//
//        }

    private func setUpButton(with title: String) -> UIButton.Configuration {
        var startButtonConfiguratin = UIButton.Configuration.filled()
        startButtonConfiguratin.baseBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        startButtonConfiguratin.cornerStyle = .large
        startButtonConfiguratin.buttonSize = .large
        startButtonConfiguratin.title = title
        startButtonConfiguratin.attributedTitle?.font = UIFont.systemFont(ofSize: 47)
        return startButtonConfiguratin
  }
}
