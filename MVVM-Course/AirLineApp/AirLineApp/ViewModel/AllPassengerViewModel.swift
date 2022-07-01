//
//  AllPassengerViewModel.swift
//  AirLineApp
//
//  Created by Mahesh Kulkarni on 30/06/22.
//

import Foundation

class AllPassengerViewModel {
    
    var passengerModelArray = [PassengerModel]()
    var airLineModelArray = [AirLineModel]()
    weak var viewController:ViewController?
    var currentPageNo = 0
    
    func getAllPassengers(pageNo:Int,pageSize:Int)  {
        let getAllPassengerUrlStr = "https://api.instantwebtools.net/v1/passenger?page=\(pageNo)&size=\(pageSize)"
        guard let url = URL(string: getAllPassengerUrlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            if let data = data {
                do {
                    let allPassenger = try JSONDecoder().decode(AllPassengersModel.self, from: data)
                    self.passengerModelArray.append(contentsOf: allPassenger.data)
                    print(self.passengerModelArray)
                    DispatchQueue.main.async {
                        self.viewController?.airLinetblView.reloadData()
                    }
                    
                } catch(let error) {
                    print(error)
                }
            }
        } .resume()
    }
    
    var numberOfRowsInSection: Int {
        return self.passengerModelArray.count
    }
    
    func getAirLineModel(index: Int) -> AirLineModel {
        return self.passengerModelArray[index].airline[0]
    }
    
    
}
