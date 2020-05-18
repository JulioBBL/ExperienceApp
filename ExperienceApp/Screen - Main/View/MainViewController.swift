//
//  MainViewController.swift
//  ExperienceApp
//
//  Created by Juliana Vigato Pavan on 15/05/20.
//  Copyright © 2020 Zewu Chen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private var data: [MainModel] = []
    
    private let controller = MainController()
    
    let recomendacoesCell = "RecomendacoesTableViewCell"
    let destaquesCell = "DestaquesCollectionViewCell"
    
    //stayHome, Livros, Jogos, Água
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        collectionView.dataSource = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: recomendacoesCell, bundle: nil), forCellReuseIdentifier: recomendacoesCell)
        collectionView.register(UINib(nibName: destaquesCell, bundle: nil), forCellWithReuseIdentifier: destaquesCell)
        controller.reload()
    }
    
    func setNavigation() {
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
}

extension MainViewController: MainControllerDelegate {
    func reloadData(data: [MainModel]) {
        self.data = data
        self.collectionView.reloadData()
        self.tableView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let celulaCollection = collectionView.dequeueReusableCell(withReuseIdentifier: destaquesCell, for: indexPath) as! DestaquesCollectionViewCell
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        celulaCollection.setUp(model: data[indexPath.row])
        return celulaCollection
    }
    
//    func collectionView(collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
//            return 100000.0
//    }
    
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let celulaTable = RecomendacoesTableViewCell(style: .default, reuseIdentifier: recomendacoesCell)
    
        let celulaTable = self.tableView.dequeueReusableCell(withIdentifier: recomendacoesCell, for: indexPath) as? RecomendacoesTableViewCell
        
        celulaTable?.setUp(model: data[indexPath.row])
    
        return celulaTable ?? UITableViewCell()
    }
}
