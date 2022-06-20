//
//  NewsCollectionViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    var stackView: UIStackView = UIStackView()
    var imageView: UIImageView = UIImageView()
    var titleLabel: UILabel = UILabel()
    
    private var imageUrl: String!
    private var title: String!
    
    func setup(imageUrl: String, title: String) {
        self.imageUrl = imageUrl
        self.title = title
        
        setupImage()
        setupTitle()
        setupStackView()
        setupStyle()

    }
    
    private func setupStackView() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.setCustomSpacing(10, after: imageView)
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupTitle() {
        titleLabel.text = self.title
        titleLabel.numberOfLines = 5
        titleLabel.contentMode = UIView.ContentMode.right
    }
    
    private func setupImage() {
        let url = URL(string: self.imageUrl)
        if let url = url {
            downloadImage(from: url)
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let constraint = imageView.widthAnchor.constraint(equalToConstant: 180)
        constraint.priority = .init(1000)
        constraint.isActive = true
    }
}

extension NewsCollectionViewCell {
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    private func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
}

extension NewsCollectionViewCell {
    private func setupStyle() {
        contentView.layer.cornerRadius = 8.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.clipsToBounds = true
    }
}
