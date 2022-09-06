//
//  CustomCell.swift
//  TechTask
//
//  Created by Артем Томило on 4.09.22.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let background = UIView(frame: .zero)
    let blurView = UIView(frame: .zero)
    var picture = UIImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setup() {
        contentView.addSubview(background)
        background.addSubview(blurView)
        background.addSubview(picture)
        
        background.translatesAutoresizingMaskIntoConstraints = false
        blurView.translatesAutoresizingMaskIntoConstraints = false
        picture.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -74),
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -74),
            
            blurView.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            blurView.topAnchor.constraint(equalTo: background.topAnchor, constant: 16),
            blurView.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -16),
            
            picture.topAnchor.constraint(equalTo: background.topAnchor),
            picture.bottomAnchor.constraint(equalTo: background.bottomAnchor),
            picture.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 16),
            picture.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -16),
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
