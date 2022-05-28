//
//  SecondViewController.swift
//  PassDataUsingClosure
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import UIKit

class SecondViewController: UIViewController {

    var completion:((String)-> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func greenBtnAction(_ sender: Any) {
        guard let completion = completion else {
            return
        }
        completion("Green")
        self.dismiss(animated: true)
    }
    

    @IBAction func redBtnAction(_ sender: Any) {
        guard let completion = completion else {
            return
        }
        completion("Red")
        self.dismiss(animated: true)

    }
    
    @IBAction func blueBtnAction(_ sender: Any) {
        guard let completion = completion else {
            return
        }
        completion("Blue")
        self.dismiss(animated: true)

    }
}
