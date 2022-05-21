//
//  NewsTableViewCell.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    
    func setup<D: UICollectionViewDelegate & UICollectionViewDataSource>(delegate: D, forRow row: Int) {
        let collectionView = UICollectionView()
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ccell")
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.tag = row
        collectionView.reloadData()
        self.contentView.addSubview(collectionView)
    }
}
