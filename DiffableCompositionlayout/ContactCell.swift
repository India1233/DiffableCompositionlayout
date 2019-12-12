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
        label.textColor = .white
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
        
        self.addSubview(contactLabel)
        self.setupLayoutConstraintsLabel()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        
        self.addSubview(imageView)
        self.setuplayoutImageView()
        
        self.addSubview(contactLabel)
        self.setupLayoutConstraintsLabel()
    }
    
    private func setuplayoutImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contactLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 0.0),
            self.imageView.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 0.0),
            self.imageView.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 0.0),
            self.imageView.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 0.0),
        ])
    }
    
    private func setupLayoutConstraintsLabel() {
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            contactLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contactLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            
//                       self.contactLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: self.imageView.leadingAnchor, multiplier: 0.0),
//                       self.contactLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.imageView.bottomAnchor, multiplier: 10.0),
//                       self.contactLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: self.imageView.trailingAnchor, multiplier: 0.0),
//
//                       self.contactLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
//        contactLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.topAnchor, multiplier: 10).isActive = true
//        contactLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 20).isActive = true
//        contactLabel.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 10).isActive = true
//        contactLabel.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 20).isActive = true
      
    }
}
