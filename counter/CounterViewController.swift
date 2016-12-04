//
//  ViewController.swift
//  counter
//
//  Created by Hung Dinh on 11/26/16.
//  Copyright © 2016 Chu Cuoi. All rights reserved.
//

import UIKit
import RxRedux
import RxCocoa
import RxSwift

final class CounterViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Actions
        
        decreaseButton.rx.tap.asDriver().drive(onNext: { _ in
            store.dispatch(CounterAction.decrease)
        }).addDisposableTo(disposeBag)
        
        increaseButton.rx.tap.asDriver().drive(onNext: { _ in
            store.dispatch(CounterAction.increase)
        }).addDisposableTo(disposeBag)
        
        
        // MARK: Data Binding
        
        store.state.map { $0.counter }.drive(onNext: { [weak self] value in
            self?.countLabel.text = "\(value)"
        }).addDisposableTo(disposeBag)
    }
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
}



