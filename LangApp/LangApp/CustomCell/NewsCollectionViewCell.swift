//
//  NewsCollectionViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    var imageUrl: String?
    
    func setup(imageUrl: String, title: String) {
        setupTitle(title: title)
        setupImage(imageUrl: imageUrl)
        
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 0.5
    }
    
    func setupTitle(title: String) {
        var titleLabel = UILabel()
        titleLabel.text = title
        
        self.contentView.addSubview(titleLabel)
    }
    
    func setupImage(imageUrl: String) {
        var image = UIImage()
        
        //self.contentView.addSubview(image)
    }
}
