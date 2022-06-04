//
//  WebService.swift
//  MVVMPracticeApp
//
//  Created by Mahesh Kulkarni on 28/05/22.
//

import Foundation

class WebService {
    
    func getAllPassengerData(urlStr: String, completion:@escaping ([PassengerDetailModel]?)->Void) {
        guard let url = URL(string: urlStr) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data ,error == nil else {
                return
            }
            let result = try! JSONDecoder().decode(PassengerModel.self, from: data)
            let passengerDetailData = result.data
            completion(passengerDetailData)
        }.resume()
    }
}
