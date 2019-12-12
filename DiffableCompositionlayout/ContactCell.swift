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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(contactLabel)
        self.setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubview(contactLabel)
        self.setupLayoutConstraints()
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
