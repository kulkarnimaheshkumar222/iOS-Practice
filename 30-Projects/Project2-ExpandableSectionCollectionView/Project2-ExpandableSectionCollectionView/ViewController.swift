//
//  ViewController.swift
//  Project2-ExpandableSectionCollectionView
//
//  Created by Mahesh Kulkarni on 01/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    let modelObjects = [
        
        HeaderItem(title: "Communication", symbols: [
            SFSymbolItem(name: "mic"),
            SFSymbolItem(name: "mic.fill"),
            SFSymbolItem(name: "message"),
            SFSymbolItem(name: "message.fill"),
        ]),
        
        HeaderItem(title: "Weather", symbols: [
            SFSymbolItem(name: "sun.min"),
            SFSymbolItem(name: "sun.min.fill"),
            SFSymbolItem(name: "sunset"),
            SFSymbolItem(name: "sunset.fill"),
        ]),
        
        HeaderItem(title: "Objects & Tools", symbols: [
            SFSymbolItem(name: "pencil"),
            SFSymbolItem(name: "pencil.circle"),
            SFSymbolItem(name: "highlighter"),
            SFSymbolItem(name: "pencil.and.outline"),
        ]),
        
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: UICollectionViewDiffableDataSource<HeaderItem,ListItem>! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureHirarchy()
        configureDataSource()
    }


}

extension ViewController {
    private func createLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, layoutEnvironment in
            var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            config.headerMode = .firstItemInSection
            let listLayout = UICollectionViewCompositionalLayout.list(using: config)
            return NSCollectionLayoutSection.list(using: config, layoutEnvironment: layoutEnvironment)
        }
    }
}

extension ViewController {
    private func configureHirarchy() {
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func configureDataSource() {
        
        // MARK: Cell registration
        
        let headerCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, HeaderItem> { (cell,indexPath,headerItem) in
            
            // Set headerItem's data to cell
            var content = cell.defaultContentConfiguration()
            content.text = headerItem.title
            cell.contentConfiguration = content
            
            // Add outline disclosure accessory
            // With this accessory, the header cell's children will expand / collapse when the header cell is tapped.
            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options:headerDisclosureOption)]
        }
        
        let symbolCellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, SFSymbolItem> { (cell, indexPath, symbolItem) in
            // Set symbolItem's data to cell
            var content = cell.defaultContentConfiguration()
            content.text = symbolItem.name
            content.image = symbolItem.image
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<HeaderItem, ListItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, listItem) -> UICollectionViewCell? in
            switch listItem {
            case .header(let headerItem):
                let headerCell = collectionView.dequeueConfiguredReusableCell(using: headerCellRegistration, for: indexPath, item: headerItem)
                return headerCell
            case .symbol(let symbolItem):
                let symbolCell = collectionView.dequeueConfiguredReusableCell(using: symbolCellRegistration, for: indexPath, item: symbolItem)
                return symbolCell
            }
        })
        
        // Create collection view section based on number of HeaderItem in modelObjects

        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<HeaderItem, ListItem>()
        dataSourceSnapshot.appendSections(modelObjects)
        dataSource.apply(dataSourceSnapshot)
        
        // Loop through each header item so that we can create a section snapshot for each respective header item.

        for headerItem in modelObjects {
            // 1
            // Create a section snapshot
            var sectionSnapShot = NSDiffableDataSourceSectionSnapshot<ListItem>()
            
            // 2
            // Create a header ListItem & append as parent
            let headerListItem = ListItem.header(headerItem)
            sectionSnapShot.append([headerListItem])
            
            // 3
            // Create an array of symbol ListItem & append as child of headerListItem
            let symbolListItemArray = headerItem.symbols.map { ListItem.symbol($0) }
            sectionSnapShot.append(symbolListItemArray, to: headerListItem)
            
            // 4
            // Expand this section by default
            sectionSnapShot.expand([headerListItem])
            
            // 5
            // Apply section snapshot to the respective collection view section
            dataSource.apply(sectionSnapShot, to: headerItem, animatingDifferences: false)
        }
        
       
    }
}
