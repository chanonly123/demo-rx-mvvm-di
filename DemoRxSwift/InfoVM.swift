//
//  InfoVM.swift
//  DemoRxSwift
//
//  Created by Chandan Karmakar on 03/02/21.
//

import Foundation
import RxRelay
import RxSwift

protocol InfoVMDelegate: class {
    func infoVMUpdate()
}

class InfoVM {
    struct Inputs {
        let userObs: BehaviorRelay<UserModel>
    }
    
    let inputs: Inputs
    let dispose = DisposeBag()
    weak var delegate: InfoVMDelegate?
    
    init(inputs: InfoVM.Inputs) {
        self.inputs = inputs
    }
    
    func subcribe() {
        inputs.userObs.subscribe { [weak self] event in
            self?.delegate?.infoVMUpdate()
        }.disposed(by: dispose)
    }
    
}
