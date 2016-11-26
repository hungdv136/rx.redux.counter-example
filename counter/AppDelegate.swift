//
//  AppDelegate.swift
//  counter
//
//  Created by Hung Dinh on 11/26/16.
//  Copyright © 2016 Chu Cuoi. All rights reserved.
//

import UIKit
import RxRedux

let store = Store<AppState>(state: AppState(), reducer: CounterReducer())

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
}

