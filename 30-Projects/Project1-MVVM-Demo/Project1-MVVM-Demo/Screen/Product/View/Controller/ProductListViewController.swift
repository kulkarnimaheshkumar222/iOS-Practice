//
//  ProductListViewController.swift
//  Project1-MVVM-Demo
//
//  Created by Mahesh Kulkarni on 24/09/23.
//

import UIKit

private enum Section: Hashable {
    case main
}

class ProductListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = ProductViewModel()
    private lazy var dataSource = configureDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Product"
        configureCollectionView()
        fetchProduct()
        configureEventHandler()
    }
    
}

extension ProductListViewController {
    private func configureCollectionView() {
        self.collectionView.collectionViewLayout = self.createLayout()
        self.collectionView.dataSource = dataSource
        let nib = UINib.init(nibName: "ProductCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .grouped)
        return UICollectionViewCompositionalLayout.list(using: config)
    }
}

extension ProductListViewController {
   private func configureDataSource() -> UICollectionViewDiffableDataSource<Section, ProductCollectionViewCellModel> {
        let dataSource = UICollectionViewDiffableDataSource<Section, ProductCollectionViewCellModel>(collectionView: collectionView) { (collectionView, indexPath, product) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
            cell.viewModel = product
            return cell
        }
        return dataSource
    }
    
    func updateSnapshot(animatingChange: Bool = false) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ProductCollectionViewCellModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.viewModel.productCellModel, toSection:.main)
        dataSource.apply(snapshot, animatingDifferences: animatingChange)
    }
}

extension ProductListViewController {
    func fetchProduct() {
        self.viewModel.fetchProduct { [weak self] in
            self?.updateSnapshot(animatingChange: true)
        }
    }
    
    func configureEventHandler() {
        self.viewModel.eventHandler = { [weak self] event in
            guard let strongSelf = self else { return }
            switch event {
            case .loading:
                print("loading")
            case .stopLoading:
                print("stopLoading")
            case .dataloaded:
                print("dataloaded")
                print(strongSelf.viewModel.product)
            case .error(let error):
                print(error?.localizedDescription ?? "")
                
            }
        }
    }
    
}
