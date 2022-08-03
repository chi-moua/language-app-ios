//
//  AppReducer+videoChannelPickerReducer.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 8/3/22.
//

import Foundation

extension AppReducer {
    static func interactorReducer(action: VideoChannelPicker.Action, state: State) -> State {
        var state = state
        
        switch action {
        case let .addChannel(row):
            // Add row to user picked
            return state
            
        case let .updateSearch(text):
            return state
        }
        
        return state
    }
}
