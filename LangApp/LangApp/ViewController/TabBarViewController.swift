//
//  TabBarViewController.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/18/22.
//

import ReSwift
import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private var store: Store<State>
    private var viewModel: TabBarViewModel
    
    init(store: Store<State>) {
        self.store = store
        viewModel = TabBarViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.dispatch(Action.viewWillAppear)
    }
    
    private func setup() {
        setupViewControllers()
        setupStyle()
    }
}

// MARK: - Tab Bar Delegate Methods
extension TabBarViewController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //store.dispatch()
    }
}

// MARK: - Setup
extension TabBarViewController {
    private func setupViewControllers() {
        let newsTab = NewsViewController(store: store)
        let videoTab = VideoChannelPicker()
        let podcastTab = PodcastViewController()
        let musicTab = MusicViewController()

        let tabBarItems: [TabBarViewModel.TabBarItemViewModel] = viewModel.tabBarItems
        let viewControllers = [newsTab, videoTab, podcastTab, musicTab]
        
        for index in 0..<4 {
            let viewController = viewControllers[index]
            let tabBarItem = tabBarItems[index]
            viewController.tabBarItem = UITabBarItem(
                title: tabBarItem.title,
                image: tabBarItem.image.image,
                tag: tabBarItem.tag
            )
        }
        
        self.setViewControllers(viewControllers, animated: false)
    }
    
    
    private func setupStyle() {
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        
        let barTintColor: UIColor = .white
        tabBarAppearance.backgroundColor = barTintColor
        
        updateTabBarItemAppearance(appearance: tabBarAppearance.compactInlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: tabBarAppearance.inlineLayoutAppearance)
        updateTabBarItemAppearance(appearance: tabBarAppearance.stackedLayoutAppearance)
        
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }

    private func updateTabBarItemAppearance(appearance: UITabBarItemAppearance) {
        let tintColor: UIColor = .black
        appearance.normal.iconColor = tintColor
        
        //let unselectedItemTintColor: UIColor = .green
        //appearance.selected.iconColor = tintColor
    }

}

extension TabBarViewController {
    enum Action: AppAction, Equatable {
        case tabBarItemClicked(Int)
        case viewWillAppear
        
        static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case let (.tabBarItemClicked(lhsVal), .tabBarItemClicked(rhsVal)):
                return lhsVal == rhsVal
            case (.viewWillAppear, .viewWillAppear):
                return true
            default:
                return false
            }
        }
    }
}
