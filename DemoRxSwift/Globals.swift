//
//  Variables.swift
//  DemoRxSwift
//
//  Created by Chandan Karmakar on 03/02/21.
//

import Foundation
import RxSwift
import RxRelay

class Globals {
    
    static var currUserObs: BehaviorRelay<UserModel>?
    
    static func initializeGlobals() {
        currUserObs = BehaviorRelay.init(value: UserModel(name: "Murali", bio: "Hello im using eezy", age: 25))
    }
}
