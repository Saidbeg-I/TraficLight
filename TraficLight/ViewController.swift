//
//  ViewController.swift
//  TraficLight
//
//  Created by 1 on 22.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redColorView: UIView!
    @IBOutlet var yellowColorView: UIView!
    @IBOutlet var greenColorView: UIView!
    
    @IBOutlet var startButtonPressed: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redColorView.alpha = 0.5
        yellowColorView.alpha = 0.5
        greenColorView.alpha = 0.5
        
        redColorView.layer.cornerRadius = redColorView.frame.width/2
        yellowColorView.layer.cornerRadius = yellowColorView.frame.width/2
        greenColorView.layer.cornerRadius = greenColorView.frame.width/2
        
        startButtonPressed.configuration = setUpButton(with: "Start")
    }
    
    @IBAction func nextButtonPressed(){
        if greenColorView.alpha == 0.5 && redColorView.alpha == 0.5 {
            redColorView.alpha = 1
            startButtonPressed.setTitle("Next", for: .normal)
        } else if yellowColorView.alpha == 0.5 && redColorView.alpha == 1{
            yellowColorView.alpha = 1
            redColorView.alpha = 0.4
        } else if yellowColorView.alpha == 1 && greenColorView.alpha == 0.5 {
            greenColorView.alpha = 1
            yellowColorView.alpha = 0.5
        } else if yellowColorView.alpha == 0.5 && greenColorView.alpha == 1 {
            greenColorView.alpha = 0.5
            redColorView.alpha = 0.5
            redColorView.alpha = 1
        }
            
            
        }
    private func setUpButton(with title: String) -> UIButton.Configuration {
        var startButtonConfiguratin = UIButton.Configuration.filled()
        startButtonConfiguratin.baseBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        startButtonConfiguratin.cornerStyle = .large
        startButtonConfiguratin.buttonSize = .large
        startButtonConfiguratin.title = title
        startButtonConfiguratin.attributedTitle?.font = UIFont.systemFont(ofSize: 27)
        return startButtonConfiguratin
  }
}
