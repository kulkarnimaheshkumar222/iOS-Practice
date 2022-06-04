//
//  WeatherListTableViewController.swift
//  GoodWeatherApp
//
//  Created by Mahesh Kulkarni on 04/06/22.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    @IBOutlet weak var weathertblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        registerWeatherTableViewCell()
    }
    
    func registerWeatherTableViewCell() {
        tableView.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: WeatherTableViewCell.cellIdentifier)
    }
}

extension WeatherListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellIdentifier, for: indexPath) as? WeatherTableViewCell else {
            return UITableViewCell()
        }
        cell.cityNameLbl.text = "Pune"
        cell.cityTempLbl.text = "61"
        return cell
        
    }
   
}

