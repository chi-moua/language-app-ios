//
//  NewsViewController.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/20/22.
//

import UIKit

class NewsViewController: UIViewController {
    var tableView: UITableView!
    var safeArea: UILayoutGuide!
    
    private var articlesData: [[Article]] = []
    private var selectedLanguage: String = "english"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView = UITableView()
        safeArea = view.layoutMarginsGuide
        setupView()
        grabArticles(language: self.selectedLanguage)
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "tcell")
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "tcell", for: indexPath) as? NewsTableViewCell {
            print("tcell cell forRowAt")
            cell.initialize()
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return articlesData.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("tableview cell will display")
        if let tableViewCell = cell as? NewsTableViewCell {
            tableViewCell.setup(delegate: self, forRow: indexPath.section)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    //titleforheader
    //will display header view
}


extension NewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articlesData[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("cell for item at")
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as? NewsCollectionViewCell {
            let article = articlesData[collectionView.tag][indexPath.row]
            cell.setup(imageUrl: article.imageUrl, title: article.title)
            print("ccell \(article.title)")
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
    
    
}

extension NewsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 414, height: 200)
    }
}


extension NewsViewController {
    func grabArticles(language: String) {
        ArticleService().getArticlesByLanguage(language: language, completionHandler: { [self] (articles) in
            self.articlesData = articles
            //print(articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
