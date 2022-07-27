//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Mahesh Kulkarni on 27/07/22.
//

import UIKit
import Combine

struct BlogPost {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    
    @IBOutlet weak var displayLbl: UILabel!
    
    var subscriber: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        submitBtn.addTarget(self, action: #selector(submitBtnClicked), for: .touchUpInside)
        
        let publisher = NotificationCenter.default.publisher(for: .myNotification)
       subscriber = publisher.sink { notification in
            guard let blogpost = notification.object as? BlogPost else { return }
            self.displayLbl.text = blogpost.title
        }
        
       
    }
    
    @objc func submitBtnClicked() {
        guard let value = textField.text else { return }
        let blogPost = BlogPost(title: value)
        NotificationCenter.default.post(name: .myNotification, object: blogPost)
        
    }

}

extension Notification.Name {
    static let myNotification = Notification.Name("MyNotification")
}
