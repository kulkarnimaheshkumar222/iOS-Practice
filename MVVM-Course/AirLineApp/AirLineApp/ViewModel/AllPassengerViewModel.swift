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
    var isPagination = false
    
    func getAllPassengers(pageNo:Int,pagination: Bool,completion:@escaping ((Result<[PassengerModel],Error>) -> Void))  {
        let getAllPassengerUrlStr = "https://api.instantwebtools.net/v1/passenger?page=\(pageNo)&size=\(Constant.pageSize)"
        guard let url = URL(string: getAllPassengerUrlStr) else { return }
        
        if pagination {
            self.isPagination = true
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with fetching films: \(error)")
                completion(.failure(error))
                return
            }
            if let data = data {
                do {
                    let allPassenger = try JSONDecoder().decode(AllPassengersModel.self, from: data)
                    completion(.success(allPassenger.data))
                    if pagination {
                        self.isPagination = false
                    }
                    
                } catch(let error) {
                    print(error)
                    completion(.failure(error))
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
