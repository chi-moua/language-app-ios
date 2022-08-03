//
//  VideoSubscriptionTableViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 7/30/22.
//

import UIKit

class VideoSubscriptionTableViewCell: UITableViewCell {
    let hStackView = UIStackView()
    let channelImageView = UIImageView()
    let channelNameLabel = UILabel()
    
    override func prepareForReuse() {
        channelImageView.image = nil
        channelNameLabel.text = ""
    }
    
    func setup(model: VideoSubscriptionCellModel) {
        setUpImage(urlString: model.imageURL)
        setUpLabel(channelName: model.channelTitle)
        setUpStack()
        
        contentView.addSubview(hStackView)
    }
    
    private func setUpImage(urlString: String) {
        channelImageView.clipsToBounds = true
        if let url = URL(string: urlString) {
            channelImageView.downloadImage(from: url)
        }
    }
    
    private func setUpLabel(channelName: String) {
        channelNameLabel.text = channelName
    }
    
    private func setUpStack() {
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.spacing = 12.0
        
        [channelImageView, channelNameLabel].forEach { view in
            hStackView.addArrangedSubview(view)
        }
        
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        hStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}

extension VideoSubscriptionTableViewCell {
    private func setupStyle() {
        contentView.layer.cornerRadius = 8.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.clipsToBounds = true
    }
}
