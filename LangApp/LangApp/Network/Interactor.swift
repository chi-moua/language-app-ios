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
    // Service class go in here
    
    init(store: Store<State>) {
        self.store = store
    }
    
    private func subscribe() {
        //subscribe to execution state
    }
    
    func newState(state: State.NetworkState.ExecutionState?) {
        guard case let .start(request) = state else {
            return
        }
        
        //dispatch loading
        
        //execute request
        
        //dispatch to store .complete(result) or .error(result)
    }
}

extension Interactor {
    enum Request: Equatable {
        case news
    }
    
    enum Action: AppAction, Equatable {
        case loading //update execution state
        case complete // handle response
    }
}
