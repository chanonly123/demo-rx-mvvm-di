//
//  EditVM.swift
//  DemoRxSwift
//
//  Created by Chandan Karmakar on 03/02/21.
//

import Foundation
import RxSwift
import RxRelay

class EditVM {
    
    struct Inputs {
        let userObs: BehaviorRelay<UserModel>
    }
    
    let inputs: Inputs
    let dispose = DisposeBag()
    
    init(inputs: EditVM.Inputs) {
        self.inputs = inputs
    }
    
    func publish(user: UserModel) {
        inputs.userObs.accept(user)
    }
    
}
