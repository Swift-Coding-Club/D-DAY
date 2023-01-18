//
//  ViewController.swift
//  D-DAY
//
//  Created by MinJi Kang on 2023/01/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addDDAY(_ sender: Any) {
        let storyboard = UIStoryboard(name: "ModalAdd", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        present(viewController, animated: true)
    }
}

