//
//  State+tabBarState.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import Foundation

extension State {
    enum TabBarState: Int, Equatable {
        case news = 0
        case video = 1
        case podCast = 2
        case music = 3
    }
}
