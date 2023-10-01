//
//  Model.swift
//  Project2-ExpandableSectionCollectionView
//
//  Created by Mahesh Kulkarni on 01/10/23.
//

import UIKit

enum Section {
    case main
}

// Header cell data type
struct HeaderItem: Hashable {
    let title: String
    let symbols: [SFSymbolItem]
}

// Symbol cell data type
struct SFSymbolItem: Hashable {
    let name: String
    let image: UIImage
    
    init(name: String) {
        self.name = name
        self.image = UIImage(systemName: name)!
    }
}

enum ListItem: Hashable {
    case header(HeaderItem)
    case symbol(SFSymbolItem)
}

/*
 Reference Tutorial links
 
 https://swiftsenpai.com/development/collectionview-expandable-list-part1/
 
 https://swiftsenpai.com/development/collectionview-expandable-list-part2/
 */
