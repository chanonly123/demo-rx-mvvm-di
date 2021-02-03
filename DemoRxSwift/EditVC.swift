//
//  ViewController.swift
//  DemoRxSwift
//
//  Created by Chandan Karmakar on 03/02/21.
//

import UIKit

class EditVC: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfBio: UITextField!
    @IBOutlet weak var tfOld: UITextField!

    var viewm: EditVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        tfName.text = viewm.inputs.userObs.value.name
        tfBio.text = viewm.inputs.userObs.value.bio
        tfOld.text = "\(viewm.inputs.userObs.value.age)"
    }

    @IBAction func actionSave() {
        let user = UserModel(name: tfName.text ?? "", bio: tfBio.text ?? "", age: Int(tfOld.text ?? "") ?? -1)
        viewm.publish(user: user)
        dismiss(animated: true)
    }
    
}

