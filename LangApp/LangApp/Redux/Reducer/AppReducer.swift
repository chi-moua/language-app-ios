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
        print("app reducer")
        guard let state = state else {
            print("returning new state")
            return State()
        }
        
        switch action {
        case let scopedAction as TabBarViewController.Action:
            return tabBarReducer(action: scopedAction, state: state)
            
        case let scopedAction as Interactor.Action:
            return interactorReducer(action: scopedAction, state: state)
            
        default:
            fatalError("reducer not added for \(action)")
        }
    }
}
