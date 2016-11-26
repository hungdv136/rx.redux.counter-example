//
//  ResetViewController.swift
//  counter
//
//  Created by Hung Dinh on 11/26/16.
//  Copyright © 2016 Chu Cuoi. All rights reserved.
//

import UIKit
import RxRedux
import RxCocoa
import RxSwift

final class ResetViewController : UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Action
        
        store.state.map{ $0.counter }.drive(onNext: { [weak self] value in
            self?.label.text = "\(value)"
        }).addDisposableTo(disposeBag)
        
        
        // MARK: Data Binding
        
        resetButton.rx.tap.asDriver().drive(onNext: { _ in
            store.dispatch(action: CounterAction.reset)
        }).addDisposableTo(disposeBag)
    }
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var label: UILabel!
}
