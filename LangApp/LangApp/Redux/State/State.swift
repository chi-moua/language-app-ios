//
//  State.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 5/21/22.
//

import Foundation
import ReSwift

struct State {
    var networkState: NetworkState = .init()
    
    var tabBarState: TabBarState?
    var newsState: NewsState = .init()
}
