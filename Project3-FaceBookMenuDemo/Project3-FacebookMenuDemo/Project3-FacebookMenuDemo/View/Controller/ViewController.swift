//
//  ViewController.swift
//  Project3-FacebookMenuDemo
//
//  Created by Mahesh Kulkarni on 13/07/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = FacebookMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCells()
        setUICollectionViewLayout()
        configureCellModels()
    }
    
    func setUICollectionViewLayout() {
        let layout = createLayout()
        collectionView.collectionViewLayout = layout
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: "MenuHeaderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuHeaderCollectionViewCell")
    }
    
    func configureCellModels() {
        viewModel.totalMenuItemCells.append(.headerCell)
    }
    
    func createLayout() -> UICollectionViewLayout {
        // Item size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        // Layout
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsIn(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuHeaderCollectionViewCell", for: indexPath) as? MenuHeaderCollectionViewCell else {
            print("cell")
            return UICollectionViewCell()
        }
        return cell
    }
}

