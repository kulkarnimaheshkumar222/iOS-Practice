//
//  ViewController.swift
//  NavigationBarItem
//
//  Created by Mahesh Kulkarni on 01/05/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Bar Button"
        view.backgroundColor = .systemPink
        makeButton()
        configureItem()
    }
    
    func makeButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Go To View 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    func configureItem() {
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add,
                                                                target: self, action: nil),
                                                   UIBarButtonItem(customView: customView())
                                                   ]
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"),
                                                                 style: .done,
                                                                 target: self,
                                                                 action: nil)
        self.navigationItem.backButtonTitle = ""
    }
    
    func customView() -> UILabel {
        let customView = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        customView.text = "Hello Buddy"
        customView.textAlignment = .center
        customView.backgroundColor = .purple
        customView.textColor = .white
        customView.layer.cornerRadius = 10
        customView.layer.masksToBounds = true
        return customView
    }

    @objc func didTapButton() {
        let secondVC = UIViewController()
        secondVC.title = "Second View"
        secondVC.view.backgroundColor = .systemGreen
        secondVC.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: nil)
        navigationController?.pushViewController(secondVC, animated: true)
    }

}

