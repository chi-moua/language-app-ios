//
//  NewsCollectionViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    private var imageUrl: String!
    private var title: String!
    
    func setup(imageUrl: String, title: String) {
        titleLabel = UILabel()
        imageView = UIImageView()
        
        self.imageUrl = imageUrl
        self.title = title
        
        setupImage()
        setupTitle()
        
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
        self.contentView.layer.borderWidth = 0.5
        
        self.contentView.trailingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
        
        
    }
    
    func setupTitle() {
        titleLabel.text = self.title
        titleLabel.numberOfLines = 5
        titleLabel.contentMode = UIView.ContentMode.left
        self.contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.imageView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
    }
    
    func setupImage() {
        let url = URL(string: self.imageUrl)
        if let url = url {
            downloadImage(from: url)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.frame = CGRect(x: 0, y: 0, width: 180, height: 120)
        self.contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        //imageView.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                print("downloading image")
                self.imageView.image = UIImage(data: data)
            }
        }
    }
}
