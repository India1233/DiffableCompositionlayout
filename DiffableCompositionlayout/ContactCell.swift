//
//  ContactCell.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
     lazy var contactLabel: UILabel = {
        let label = UILabel()
        //label.backgroundColor = .magenta
        label.textColor = .black
        label.contentMode = .center
       return label
    }()
    
    lazy var imageView:UIImageView = {
     let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
      //  imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        self.setuplayoutImageView()

        
//        self.addSubview(contactLabel)
//        self.setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        self.addSubview(contactLabel)
//        self.setupLayoutConstraints()
        
        self.addSubview(imageView)
        self.setuplayoutImageView()
    }
    
    private func setuplayoutImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        //self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 0.0),
            self.imageView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 0.0),
            self.imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 0.0),
            self.imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 0.0)
        ])
    }
    
    private func setupLayoutConstraints() {
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contactLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
//        contactLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 10).isActive = true
//        contactLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 20).isActive = true
//        contactLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 10).isActive = true
//        contactLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 20).isActive = true
      
    }
}
