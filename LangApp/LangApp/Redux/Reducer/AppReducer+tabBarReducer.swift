//
//  AppReducer+tabBarReducer.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import Foundation

extension AppReducer {
    static func tabBarReducer(action: TabBarViewController.Action, state: State) -> State {
        var state = state
        
        switch action {
        case .viewWillAppear:
            state.networkState.executionState = .start(.news)
        case let .tabBarItemClicked(val):
            if let tabView = State.TabBarState(rawValue: val) {
                state.tabBarState = tabView
            }
        }
        
        return state
    }
}

extension State.TabBarState {
    
}
