//
//  ViewController.swift
//  DiffableCompositionlayout
//
//  Created by Sachin Dumal on 12/12/19.
//  Copyright © 2019 Sachin Dumal. All rights reserved.
// https://medium.com/@yoellev8/diffable-data-sources-compositional-layouts-part-1-2-90f53f120fdc

import UIKit

// MARK:- OLD
//fileprivate typealias DataSource = UICollectionViewDiffableDataSource<CollectionViewController.Section, Contact>
//fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<CollectionViewController.Section, Contact>

// MARK:- Diffable DataSource & SnapShot typealias
fileprivate typealias DataSource = UICollectionViewDiffableDataSource<CollectionViewController.Section, JSONContact>
fileprivate typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<CollectionViewController.Section, JSONContact>

// MARK:- CollectionViewController Class
class CollectionViewController: UIViewController {
    
    // MARK:- Properties
    let cellId = "cellId"
    private var contacts = [Contact]()
    private var dataSource:DataSource!
    private var snapShot = DataSourceSnapshot()
    private var collectionView:UICollectionView! = nil
    
    // MARK:- ViewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Diffable Data Source"
       // createData()
        configureHierarchy()
        configureDataSource()
        setupUIRefreshController(with: collectionView)
    }
    
    // MARK:- Refresh Controller
    func setupUIRefreshController(with collectionView: UICollectionView)  {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refreshControl.tintColor = .gray
        collectionView.refreshControl = refreshControl
    }
    
    // MARK:- Refresh Handler
    @objc func handleRefresh(){
        NetworkService.shared.downloadContactsFromServer { (result) in
            switch result {
            case .success(let jsonContacts):
                self.createSnapshot(with: jsonContacts)
            case .failure(let error):
                self.dispalyAlert(with: error)
            }
        }
    }
    
    // MARK:- Snapshot
   private func createSnapshot(with jsonContacts:[JSONContact])  {
    DispatchQueue.main.async {
        self.snapShot.deleteAllItems()
        self.snapShot.appendSections([Section.One])
        self.snapShot.appendItems(jsonContacts)
        self.dataSource.apply(self.snapShot, animatingDifferences: true)
    }
    DispatchQueue.main.async {
        self.collectionView.refreshControl?.endRefreshing()
    }
}
    
    // MARK:- AlertService
    private func dispalyAlert(with error: String) {
        let alert = AlertService.createNetworkAlert(title: "Response Error!!!", message: error) {
            print("Ok!!!")
        }
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK:- Collectopn View Setup
extension CollectionViewController {
    
    // MARK:- Create Data
    private func createData(){
        for i in 1..<17 {
            contacts.append(Contact(name: "Animal\(i)", image: "Animal\(i)"))
       }
    }
    
    // MARK:- Create Layout
    private func createLayout() -> UICollectionViewLayout {
        
        let seethisImage =   #imageLiteral(resourceName: "FlowlayoutImage")
        print(seethisImage)
        
        // 1
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 8, trailing: 16)
        
        //2
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.15))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //3
        let section = NSCollectionLayoutSection(group: group)
        
        //4
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    // MARK:- Create CollectionView
    private func configureHierarchy(){
        //1
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        //2
        collectionView.delegate = self
        //3
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor  = .white
        //4
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
    }
    
    //MARK:- Diffable DataSource
    private func configureDataSource() {
        dataSource = DataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, contact) -> ContactCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! ContactCell
//            cell.contactLabel.text = contact.name
//            cell.imageView.image = UIImage(named: contact.imageUrl)
            cell.jsonContact = contact
            return cell
        })
       
        /*
        var snapShot = DataSourceSnapshot()
        snapShot.appendSections([.One])
        snapShot.appendItems(self.contacts)
        self.dataSource.apply(snapShot, animatingDifferences: true)
        */
        
        
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
