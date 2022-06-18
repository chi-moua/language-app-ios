//
//  State+networkState.swift
//  LangApp
//
//  Created by Kongfuechi Moua on 6/17/22.
//

import Foundation

extension State {
    struct NetworkState: Equatable {
        
        var executionState: ExecutionState?
        
        enum ExecutionState: Equatable {
            case start(Interactor.Request)
            case loading
        }
    }
}
