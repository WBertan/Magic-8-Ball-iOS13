//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    @IBAction func askButtonPressed(_ askButton: UIButton) {
        askButton.isEnabled = false
        askButton.fadeOut()
        askButton.setBackgroundImage(ballArray.randomElement(), for: .normal)
        askButton.fadeIn(2.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            askButton.fadeOut()
            askButton.setBackgroundImage(#imageLiteral(resourceName: "ball0"), for: .normal)
            askButton.fadeIn(1.0)
            askButton.isEnabled = true
        }
    }
    
}

extension UIView {
    func fadeTo(_ alpha: CGFloat, duration: TimeInterval = 0.3) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration) {
                self.alpha = alpha
            }
        }
    }
    
    func fadeIn(_ duration: TimeInterval = 0.3) {
        fadeTo(1.0, duration: duration)
    }
    
    func fadeOut(_ duration: TimeInterval = 0.3) {
        fadeTo(0.0, duration: duration)
    }
}
