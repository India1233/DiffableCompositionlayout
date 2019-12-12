//
//  ViewController.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
// https://medium.com/@yoellev8/diffable-data-sources-compositional-layouts-part-1-2-90f53f120fdc

import UIKit

// MARK:- Diffable DataSource & SnapShot typealias
fileprivate typealias DataSource = UICollectionViewDiffableDataSource<CollectionViewController.Section, Contact>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<CollectionViewController.Section, Contact>

// MARK:- CollectionViewController Class
class CollectionViewController: UIViewController {
    
    // MARK:- Properties
    let cellId = "cellId"
    private var contacts = [Contact]()
    private var dataSource:DataSource!
    private var collectionView:UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Diffable Data Source"
        createData()
        configureHierarchy()
        configureDataSource()
    }
}

// MARK:- Collectopn View Setup
extension CollectionViewController {
    
    private func createData(){
        for i in 1..<17 {
            contacts.append(Contact(name: "Animal\(i)", image: "Animal\(i)"))
       }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        let seethisImage =   #imageLiteral(resourceName: "FlowlayoutImage")
        print(seethisImage)
        
        // 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16)
        
        //2
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.25))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        
        //3
        let section = NSCollectionLayoutSection(group: group)
        
        //4
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func configureHierarchy(){
        //1
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        //2
        collectionView.delegate = self
        //3
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor  = .systemBackground
        //4
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
    }
    
    private func configureDataSource(){
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, contact) -> ContactCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! ContactCell
            cell.contactLabel.text = contact.name
            cell.imageView.image = UIImage(named: contact.image)
           // cell.backgroundColor = .cyan
            return cell
        })
        
        var snapShot = DataSourceSnapshot()
        snapShot.appendSections([.One])
        snapShot.appendItems(self.contacts)
        self.dataSource.apply(snapShot, animatingDifferences: true)
        
    }
}

// MARK:- CollectionView Delegate
extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let contact = dataSource.itemIdentifier(for: indexPath) else { return}
        //let snapShot = dataSource.snapshot()
        print(contact)
        
    }
}


// MARK:- Enum Extension
extension CollectionViewController {
  fileprivate enum Section {
        case One
    }
}
