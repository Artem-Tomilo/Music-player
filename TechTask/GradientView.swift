//
//  GradientView.swift
//  TechTask
//
//  Created by Артем Томило on 6.09.22.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gradientLayer)
        setupGradientColors()
        gradientLayer.locations = [0.43, 0.72]
        gradientLayer.startPoint = CGPoint(x: 0.75, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    private func setupGradientColors() {
        gradientLayer.colors = [
            UIColor(red: 0.114, green: 0.09, blue: 0.149, alpha: 0.1).cgColor,
            UIColor(red: 0.114, green: 0.09, blue: 0.149, alpha: 1).cgColor
        ]
    }
}
