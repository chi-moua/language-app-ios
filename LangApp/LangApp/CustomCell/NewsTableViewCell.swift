//
//  NewsTableViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    var collectionView: UICollectionView!
    
    func setup<D: UICollectionViewDelegate & UICollectionViewDataSource>(delegate: D, forRow row: Int) {
        collectionView = UICollectionView()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ccell")
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.tag = row
        collectionView.reloadData()
        contentView.addSubview(collectionView)
        
        
        setupConstrainsts()
    }
    
    private func setupConstrainsts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
    }
}
