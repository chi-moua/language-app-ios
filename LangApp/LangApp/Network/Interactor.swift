//
//  Interactor.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import ReSwift
import Foundation

class Interactor: StoreSubscriber {
    let store: Store<State>
    
    init(store: Store<State>) {
        self.store = store
        subscribe()
    }
    
    private func subscribe() {
        store.subscribe(self) {
            $0.select {
                $0.networkState.executionState
            }
        }
    }
    
    func newState(state: State.NetworkState.ExecutionState?) {
        guard case let .start(request) = state else {
            return
        }
        
        //dispatch loading
        store.dispatch(Action.loading)
        
        //execute request
        handleRequest(request)
        
        //dispatch to store .complete(result) or .error(result)
        //store.dispatch(Action.complete(result))
    }
}

extension Interactor {
    func handleRequest(_ request: Request) {
        switch request {
        case .news:
            ArticleService.fetchArticles("english", completion: { [self] articles in
                    self.store.dispatch(Action.complete(.news(articles)))
            })
        }
    }
}

extension Interactor {
    enum Request: Equatable {
        case news
    }
    
    enum Response: Equatable {
        case news(Articles)
        case error
        
        static func == (lhs: Response, rhs: Response) -> Bool {
            switch (lhs, rhs) {
            case let (.news(lhsArticle), .news(rhsArticle)):
                return lhsArticle == rhsArticle
            case (.error, .error):
                return true
            default:
                return false
            }
        }
    }
    
    enum Action: AppAction, Equatable {
        case loading //update execution state
        case complete(Response) // handle response
    }
}
