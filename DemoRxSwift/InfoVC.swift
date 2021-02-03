//
//  ViewController.swift
//  DemoRxSwift
//
//  Created by Chandan Karmakar on 03/02/21.
//

import UIKit

class InfoVC: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var lblOld: UILabel!
    
    var viewm: InfoVM = InfoVM(inputs: .init(userObs: Globals.currUserObs!))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewm.delegate = self
        viewm.subcribe()
    }
    
    @IBAction func actionEdit() {
        if let userObs = Globals.currUserObs {
            let viewc = storyboard?.instantiateViewController(withIdentifier: "EditVC") as! EditVC
            viewc.viewm = EditVM(inputs: .init(userObs: userObs))
            present(viewc, animated: true)
        }
    }

}

extension InfoVC: InfoVMDelegate {
    func infoVMUpdate() {
        lblName.text = viewm.inputs.userObs.value.name
        lblBio.text = viewm.inputs.userObs.value.bio
        lblOld.text = "\(viewm.inputs.userObs.value.age)"
    }
}
