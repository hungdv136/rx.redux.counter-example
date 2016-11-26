//
//  CounterReducer.swift
//  counter
//
//  Created by Hung Dinh on 11/26/16.
//  Copyright © 2016 Chu Cuoi. All rights reserved.
//

import RxRedux

struct CounterReducer: Reducer {
    func handleAction(state: AppState, action: Action) -> AppState {
        var state = state
        guard let action = action as? CounterAction else { return state }
        
        switch action {
        case .increase:
            state.counter += 1
            
        case .decrease:
            state.counter -= 1
            
        case .reset:
            state.counter = 0
            
        }
        return state
    }
}
