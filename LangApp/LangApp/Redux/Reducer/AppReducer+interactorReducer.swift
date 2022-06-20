//
//  AppReducer+interactorReducer.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/18/22.
//

import ReSwift
import Foundation


extension AppReducer {
    static func interactorReducer(action: Interactor.Action, state: State) -> State {
        print("interactor reducer")
        var state = state
        
        switch action {
        case let .complete(response):
            state = interactorResponseState(response, state: state)
        case .loading:
            state.networkState.executionState = .loading
        }
        return state
    }
    
    private static func interactorResponseState(_ networkResponse: Interactor.Response, state: State) -> State {
        var state = state
        
        state.networkState.executionState = nil
        
        switch networkResponse {
        case let .news(response):
            let articles = response as Articles
            state.newsState.articles = ArticlesData(articles.results)
            print("articles here \(state.newsState.articles)")
        case .error:
            return state
        }
        
        return state
    }
}
