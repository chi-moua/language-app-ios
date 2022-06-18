//
//  TabBarViewModel.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import Foundation

struct TabBarViewModel {
    struct TabBarItemViewModel {
        let title: String
        let image: UI.Image
        let tag: Int
    }
    
    var tabBarItems: [TabBarItemViewModel] {
        let newsTabBarItem = TabBarItemViewModel(
            title: "News",
            image: UI.Image.newspaperIcon,
            tag: 0
        )
        
        let videoTabBarItem = TabBarItemViewModel(
            title: "Video",
            image: UI.Image.tvIcon,
            tag: 1
        )
        
        let podcastTabBarItem = TabBarItemViewModel(
            title: "Podcast",
            image: UI.Image.microphoneIcon,
            tag: 2
        )
        
        let musicTabBarItem = TabBarItemViewModel(
            title: "Music",
            image: UI.Image.headphoneIcon,
            tag: 3
        )
        
        return [
            newsTabBarItem,
            videoTabBarItem,
            podcastTabBarItem,
            musicTabBarItem
        ]
    }
}
