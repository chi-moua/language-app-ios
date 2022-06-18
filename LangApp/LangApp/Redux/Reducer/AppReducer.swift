//
//  AppReducer.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import ReSwift
import Foundation

enum AppReducer {
    static func appReducer(action: Action, state: State?) -> State {
        guard let state = state else {
            return State()
        }
        
        switch action {
        case let scopedAction as TabBarViewController.Action:
            return tabBarReducer(action: scopedAction, state: state)
            
        default:
            return state
        }
    }
}
