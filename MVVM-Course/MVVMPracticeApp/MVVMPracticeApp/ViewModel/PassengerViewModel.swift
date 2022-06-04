//
//  PassengerViewModel.swift
//  MVVMPracticeApp
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import Foundation

class PassengerViewModel {
    
    var passengerDetailModelArray: [PassengerDetailModel]?
    
    func getpassengerData(pageNumber:Int,completion:@escaping ()->()){
        let urlString = "https://api.instantwebtools.net/v1/passenger?page=\(pageNumber)&size=20"
        WebService().getAllPassengerData(urlStr:urlString) { result in
            guard let result = result else {
                return
            }
            self.passengerDetailModelArray = result
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return self.passengerDetailModelArray?.count ?? 0
    }
    
    
}
