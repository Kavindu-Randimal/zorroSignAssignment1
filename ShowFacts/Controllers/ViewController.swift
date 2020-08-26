//
//  ViewController.swift
//  ShowFacts
//
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func moveToList(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: "list") as! ListViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
}

