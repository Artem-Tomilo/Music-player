//
//  UIButton + ViewController.swift
//  TechTask
//
//  Created by Артем Томило on 5.09.22.
//

import UIKit

extension UIButton {
    func playImage() {
        self.setImage(UIImage(named: "Play"), for: .normal)
    }
    
    func pauseImage() {
        self.setImage(UIImage(named: "Pause"), for: .normal)
    }
}
