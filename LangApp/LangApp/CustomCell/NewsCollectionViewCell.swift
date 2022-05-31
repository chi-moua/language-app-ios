//
//  NewsCollectionViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var imageUrl: String?
    
    func setup(imageUrl: String, title: String) {
        titleLabel = UILabel()
        imageView = UIImageView()
        
        setupTitle(title: title)
        setupImage(imageUrl: imageUrl)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(imageView)
        
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 0.5
        
        
    }
    
    func setupTitle(title: String) {
        titleLabel.text = title
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupImage(imageUrl: String) {
        let image = UIImage()
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
}
