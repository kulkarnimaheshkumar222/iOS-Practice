//
//  FacebookMenuViewModel.swift
//  Project3-FacebookMenuDemo
//
//  Created by Mahesh Kulkarni on 13/07/24.
//

import Foundation

class FacebookMenuViewModel {
    var totalMenuItemCells = [FacebookMenuCellTypes]()
    
    func numberOfItemsIn(section: Int) -> Int {
        return totalMenuItemCells.count
    }
}
