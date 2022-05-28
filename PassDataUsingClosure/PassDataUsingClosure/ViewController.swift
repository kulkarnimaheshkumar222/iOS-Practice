//
//  ViewController.swift
//  PassDataUsingClosure
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorSelectionLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func nextBtnClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let SecondViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        SecondViewController.completion = { color in
            self.colorSelectionLbl.text = "You have Selected \(color) color."
        }
        present(SecondViewController, animated: true)
    }
    
}

