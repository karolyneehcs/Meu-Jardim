//
//  PageCell.swift
//  MeuJardim
//
//  Created by Ana Karolina Costa da Silva on 11/06/20.
//  Copyright © 2020 Jhennyfer Rodrigues de Oliveira. All rights reserved.
//

import UIKit


class PageCell: UICollectionViewCell {
    
    var page : Page? {
        didSet {
            
            guard let unwrappedPage = page else { return  }
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(red: 138/255, green: 38/255, blue: 5/255, alpha: 1)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light), NSAttributedString.Key.foregroundColor: UIColor(red: 138/255, green: 38/255, blue: 5/255, alpha: 1)]))
            
            profileImageView.image = UIImage(named: unwrappedPage.imageName)
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
        }
    }
    
     private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        let profile = UIImage(named: "onboarding1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = profile
        
        return imageView
    }()
    
    
     private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Vamos te ajudar a cuidar das suas plantas!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18), NSAttributedString.Key.foregroundColor: UIColor(red: 138/255, green: 38/255, blue: 5/255, alpha: 1)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nTemos dicas desde materiais para regar até manter suas preciosas longe de pragas.", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .light), NSAttributedString.Key.foregroundColor: UIColor(red: 138/255, green: 38/255, blue: 5/255, alpha: 1)]))
        
        textView.attributedText = attributedText
    
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.leadingAnchor.constraint(equalTo:
            leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo:
            trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        
        topImageContainerView.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        profileImageView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 100)
        
        profileImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor)
//        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        addSubview(descriptionTextView)
        

        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
