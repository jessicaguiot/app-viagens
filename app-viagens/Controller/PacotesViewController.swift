//
//  PacotesViewController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 13/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class PacotesViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Elements
    
    let stackView = UIStackView()
    
    
    let packagesLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Pacotes"
        label.font = UIFont.systemFont(ofSize: 20)
        
        return label
    }()
    
    let packagesFoundLabel: UILabel = {
        
        let label = UILabel()
              
        label.text = "6 pacotes encontrados"
        label.font = UIFont.systemFont(ofSize: 20)
              
        return label
        
    }()
    
    let textField: UITextField = {
        
        let textField = UITextField()
        
        textField.borderStyle = .roundedRect
        
        return textField
        
    }()
    
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    

    
    //MARK: - Atributos
    
    struct CellsCollection {
        
        static let collectionViewCell = "CollectionViewCell"
        
    }
    
    var listTripsCell = [Trips]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureStackView()
        setStackViewConstraints()
        addElementsToStackView()
        
        
        setDelegateCollection()
        configureCollectioView()
        
        listTripsCell = fetchData()
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 240/255, alpha: 1.0)
        
    }
    
    //MARK: - Stack View configuration
    
    
    //Demonstrate how to use UIStackView
    
    func configureStackView(){
        
        view.addSubview(stackView)
        stackView.axis          = .vertical
        stackView.distribution  = .fill
        stackView.spacing       = 15
        
    }
    
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints                                       = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive            = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive    = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive       = true
        
    }
    
    func addElementsToStackView(){
        stackView.addArrangedSubview(packagesLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(packagesFoundLabel)
        stackView.addArrangedSubview(collectionView)
    }
    
}


extension PacotesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Demonstrate how to use UICollectionView
    
    func setDelegateCollection(){
        
        collectionView.delegate = self
        collectionView.dataSource = self

        
    }
    
    func configureCollectioView(){
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CellsCollection.collectionViewCell)
        
        collectionView.backgroundColor = .clear
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 135, height: 160)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTripsCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsCollection.collectionViewCell, for: indexPath) as! CollectionViewCell
        
        cell.setInformationCell(Trip: listTripsCell[indexPath.item])
        
        
        return cell
        
    }
    
    
    
    
}



extension PacotesViewController {
    
    func fetchData() -> [Trips] {
        
        let ceara = Trips(title: "Ceará", numberOfDays: "3", price: "1.800,59", tripImage: UIImage(named:"img1")!)
        let rioDeJaneiro = Trips(title: "Rio de Janeiro", numberOfDays: "6", price: "2.900,00", tripImage: UIImage(named:"img2")!)
        let saoPaulo = Trips(title: "São Paulo", numberOfDays: "8", price: "3.000,00", tripImage: UIImage(named:"img3")!)
        let minasGerais = Trips(title: "Minas Gerais", numberOfDays: "12", price: "5.800,59", tripImage: UIImage(named:"img4")!)
        let amazonas = Trips(title: "Amazonas", numberOfDays: "4", price: "4.800,59", tripImage: UIImage(named:"img5")!)
        return [ceara, rioDeJaneiro, saoPaulo, amazonas, minasGerais]
        
        
    }
}
