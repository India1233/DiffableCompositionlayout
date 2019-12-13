//
//  ContactCell.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    var jsonContact: JSONContact? {
        didSet {
            contactLabel.text = jsonContact?.name
            imageView.loadImageUsingCacheWithUrlString(urlString: jsonContact?.imageUrl ?? "")
        }
    }
    
    
     lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Contact Name", size: 22)
        label.textColor = UIColor.init(white: 0.3, alpha: 0.4)
        label.contentMode = .center
       return label
    }()
    
    lazy var imageView:UIImageView = {
     let profileImg  = UIImage(systemName: "person.crop.circle")
     let renderedImg = profileImg?.withTintColor(.gray, renderingMode: .alwaysOriginal)
     let imageView = UIImageView(image: renderedImg)
     imageView.translatesAutoresizingMaskIntoConstraints = false
     imageView.layer.cornerRadius = 25
     imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardCellShadow()
       setupCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
    
        self.backgroundView?.addSubview(imageView)
        self.backgroundView?.addSubview(contactLabel)

        NSLayoutConstraint.activate([
                    imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                    imageView.widthAnchor.constraint(equalToConstant: 50),
                    imageView.heightAnchor.constraint(equalToConstant: 50),

                    contactLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
                    contactLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
                    contactLabel.widthAnchor.constraint(equalToConstant: 200),
                    contactLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    func setupCardCellShadow() {
         backgroundView = UIView()
         addSubview(backgroundView!)
         backgroundView?.fillSuperview()
         backgroundView?.backgroundColor     = .white
         backgroundView?.layer.cornerRadius  = 26
         backgroundView?.layer.shadowOpacity = 0.1
         backgroundView?.layer.shadowOffset  = .init(width: 4, height: 10)
         backgroundView?.layer.shadowRadius  = 10

         layer.borderColor  = UIColor.gray.cgColor
         layer.borderWidth  = 0.2
         layer.cornerRadius = 26
         self.layoutIfNeeded()
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
