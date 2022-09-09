//
//  CustomCell.swift
//  TechTask
//
//  Created by Артем Томило on 4.09.22.
//

import UIKit
import ScalingCarousel

class CustomCell: ScalingCarouselCell {
    
    var picture = UIImageView()
    let blurView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        mainView = UIView(frame: contentView.bounds)
        contentView.addSubview(mainView)
        mainView.addSubview(blurView)
        mainView.addSubview(picture)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        picture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.widthAnchor.constraint(equalToConstant: 341),
            mainView.heightAnchor.constraint(equalToConstant: 309),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -74),
            
            blurView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16),
            blurView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            
            picture.topAnchor.constraint(equalTo: mainView.topAnchor),
            picture.bottomAnchor.constraint(equalTo: mainView.bottomAnchor),
            picture.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            picture.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
        ])
        
        blurView.backgroundColor = UIColor(named: "blur")
        
        picture.layer.cornerRadius = 10
        picture.clipsToBounds = true
        blurView.layer.cornerRadius = 10
        
        blurView.layer.shadowColor = UIColor.black.cgColor
        blurView.layer.shadowOpacity = 0.14
        blurView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        blurView.layer.shadowRadius = 50.0
        blurView.layer.borderWidth = 1
        blurView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.1)
        
        picture.layer.shadowColor = UIColor.black.cgColor
        picture.layer.shadowOpacity = 0.14
        picture.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        picture.layer.shadowRadius = 50.0
        picture.layer.borderWidth = 1
        picture.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 0.1)
    }
}
