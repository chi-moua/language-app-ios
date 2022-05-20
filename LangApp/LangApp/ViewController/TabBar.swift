//
//  TabBar.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/18/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setup() {
        setupViewControllers()
        setupStyle()
    }
    
    private func setupViewControllers() {
        let newsTab = NewsViewController()
        let newsTabBarItem = UITabBarItem(
            title: "News",
            image: UI.Image.newspaperIcon.image,
            tag: 0
        )
        newsTab.tabBarItem = newsTabBarItem
        
        let videoTab = VideoViewController()
        let videoTabBarItem = UITabBarItem(
            title: "Video",
            image: UI.Image.tvIcon.image,
            tag: 1
        )
        videoTab.tabBarItem = videoTabBarItem
        
        let podcastTab = PodcastViewController()
        let podcastTabBarItem = UITabBarItem(
            title: "Podcast",
            image: UI.Image.microphoneIcon.image,
            tag: 2
        )
        podcastTab.tabBarItem = podcastTabBarItem
        
        let musicTab = MusicViewController()
        let musicTabBarItem = UITabBarItem(
            title: "Music",
            image: UI.Image.headphoneIcon.image,
            tag: 3
        )
        musicTab.tabBarItem = musicTabBarItem
        
        let viewControllers = [newsTab, videoTab, podcastTab, musicTab]
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
        //let unselectedItemTintColor: UIColor = .green
        
        //appearance.selected.iconColor = tintColor
        appearance.normal.iconColor = tintColor
    }

}

