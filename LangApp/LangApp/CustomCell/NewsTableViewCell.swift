//
//  NewsTableViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let collectionView:UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    func initialize() {
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = UIColor.clear
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "ccell")
        contentView.addSubview(collectionView)
        setupConstrainsts()
        print("register ccell")
    }
    
    func setup<D: UICollectionViewDelegate & UICollectionViewDataSource>(delegate: D, forRow row: Int) {
        print("register ccell delegate")
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.tag = row
        collectionView.reloadData()
    }
    
    private func setupConstrainsts() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
    }
}
