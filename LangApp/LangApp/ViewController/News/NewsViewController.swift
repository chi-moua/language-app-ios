//
//  NewsViewController.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/20/22.
//

import ReSwift
import UIKit

class NewsViewController: UIViewController, StoreSubscriber {
    var tableView: UITableView!
    var safeArea: UILayoutGuide!
    
    private let store: Store<State>
    private var viewModel: NewsViewModel
    
    init(store: Store<State>) {
        self.store = store
        self.viewModel = NewsViewModel(store: store)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        tableView = UITableView()
        safeArea = view.layoutMarginsGuide
        setupStaticView()
        subscribe()
        //grabArticles(language: self.selectedLanguage)
    }
    
    private func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.newsState
            }.skipRepeats()
        }
    }
    
    func newState(state: State.NewsState) {
        setupDynamicView(state: state)
    }
    
    func setupStaticView() {
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
    
    func setupDynamicView(state: State.NewsState) {
        viewModel.articlesData = state.articles
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
        return viewModel.articlesData.categoryCount
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
        return viewModel.articlesData.retrieveCategoryList(index: collectionView.tag)?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let articleList = viewModel.articlesData.retrieveCategoryList(index: collectionView.tag) else {
            return UICollectionViewCell()
        }
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ccell", for: indexPath) as? NewsCollectionViewCell {
            let article = articleList[indexPath.row]
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
        return CGSize(width: 400, height: 180)
    }
}

/*extension NewsViewController {
    func grabArticles(language: String) {
        ArticleService().getArticlesByLanguage(language: language, completionHandler: { [self] (articles) in
            self.articlesData = articles
            //print(articles)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}*/
