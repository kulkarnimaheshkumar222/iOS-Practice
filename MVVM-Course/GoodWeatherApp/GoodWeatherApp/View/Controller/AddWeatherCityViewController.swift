//
//  AddWeatherCityViewController.swift
//  GoodWeatherApp
//
//  Created by Mahesh Kulkarni on 04/06/22.
//

import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField:UITextField!
    @IBOutlet weak var saveBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        saveBtn.layer.cornerRadius = 10
    }
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        guard let city = cityNameTextField.text else {
            return
        }
        guard let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(Constant.apiKey)&units=imperial") else {
            return
        }
        let weatherResource = Resource<Any>(url: weatherURL) { data in
            return data
        }
        WebService().load(resource: weatherResource) { result in
            print(result)
        }
    }
    
    @IBAction func closeBtnClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
