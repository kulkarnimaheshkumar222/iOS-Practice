//
//  FbMenuViewModel.swift
//  Project3-FacebookMenuApp
//
//  Created by Mahesh Kulkarni on 07/01/24.
//

import Foundation

class FbMenuViewModel {
    var cellType: [FbMenuViewController.CellType] = []
    
    
    func configureCellTypes() {
        cellType.append(.menuHeaderCell)
    }
    
    func numberOfRows() -> Int {
        return cellType.count
    }
    
    func getRowType(_ index: Int) -> FbMenuViewController.CellType {
        return cellType[index]
    }
}
