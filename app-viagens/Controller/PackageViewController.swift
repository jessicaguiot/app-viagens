//
//  PacotesViewController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 13/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class PackageViewController: UIViewController, UICollectionViewDelegateFlowLayout {

    //MARK: - Elements
    
    let stackView = UIStackView()
    
    
    let packagesLabel: UILabel = {
        
        let label = UILabel()
        
        label.text = "Pacotes"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        
        return label
    }()
    
    let packagesFoundLabel: UILabel = {
        
        let label = UILabel()
              
        label.text = "6 pacotes encontrados"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        
        
        return label
        
    }()
    
    let searchBar =  UISearchBar()
    
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    

    
    //MARK: - Atributos
    
    struct CellsCollection {
        
        static let collectionViewCell = "CollectionViewCell"
        
    }
    
    var listWithAllTrips = [PackageTrip]()
    var listTrips = [PackageTrip]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        listWithAllTrips = fetchDataPackages()
        listTrips = listWithAllTrips
        
        configureStackView()
        setStackViewConstraints()
        addElementsToStackView()
        
        delegateSearchBar()
        configureSearchBar()
        setLayoutConstraintsSearchBar()
        
        setDelegateCollection()
        configureCollectioView()
        
        
        view.backgroundColor = UIColor(red: 235/255, green: 235/255, blue: 240/255, alpha: 1.0)
        self.packagesFoundLabel.text = self.reloadCountLabel()
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
        stackView.addArrangedSubview(searchBar)
        stackView.addArrangedSubview(packagesFoundLabel)
        stackView.addArrangedSubview(collectionView)
    }
    
}


extension PackageViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
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
        let widthCell = collectionView.bounds.width / 2
        
        return CGSize(width: widthCell - 15 , height: 160)
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTrips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsCollection.collectionViewCell, for: indexPath) as! CollectionViewCell
        
        cell.setInformationCell(Trip: listTrips[indexPath.item].trip)
        
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let package = listTrips[indexPath.item]
        
        
        let informationViewController = InformationViewController()
        
        informationViewController.modalPresentationStyle = .fullScreen
        informationViewController.packageSelected = package
        
        self.present(informationViewController, animated: true, completion: nil)
    }
    
    
    
    
}



extension PackageViewController {
    
    func fetchDataPackages() -> [PackageTrip] {
        
        let packagePortoGalinhas = PackageTrip(hotelName: "Resort Porto de Galinhas", descriptionTrip: "Hotel + café da manhã", tripDate: "8~15 de agosto", trip: Trips(title: "Porto de Galinhas", numberOfDays: "7", price: "2.490,00", tripImage: UIImage(named: "img6")!))
        let packageBuzios = PackageTrip(hotelName: "Resort Buzios Spa", descriptionTrip: "Hotel + café da manhã", tripDate: "9~16 de setembro", trip: Trips(title: "Buzios", numberOfDays: "5", price: "1.990,99", tripImage: UIImage(named: "img7")!))
        let packageNatal = PackageTrip(hotelName: "Resort Natal Show", descriptionTrip: "Hotel + café da manhã", tripDate: "13~18 de setembro", trip: Trips(title: "Natal", numberOfDays: "4", price: "1.700,00", tripImage: UIImage(named: "img8")!))
        let packageRioJaneiro = PackageTrip(hotelName: "Resort RJ Spa", descriptionTrip: "Hotel + café da manhã", tripDate: "9~13 de outubro", trip: Trips(title: "Rio de Janeiro", numberOfDays: "4", price: "2.300,00", tripImage: UIImage(named: "img9")!))
        let packageAmazonas = PackageTrip(hotelName: "Pousada Amazonas Plus", descriptionTrip: "Hotel + café da manhã", tripDate: "9~15 de outubro", trip: Trips(title: "Amazonas", numberOfDays: "6", price: "2.850,00", tripImage: UIImage(named: "img10")!))
        let packageSalvador = PackageTrip(hotelName: "Pousada Salvador", descriptionTrip: "Hotel + café da manhã", tripDate: "5~10 de novembro", trip: Trips(title: "Salvador", numberOfDays: "5", price: "1.880,90", tripImage: UIImage(named: "img11")!))
       
        return [packagePortoGalinhas, packageBuzios, packageNatal, packageRioJaneiro, packageAmazonas, packageSalvador]
        
        
    }
}

extension PackageViewController: UISearchBarDelegate {
    
    func delegateSearchBar(){
        searchBar.delegate = self
    }
    
    func configureSearchBar(){
        
        searchBar.placeholder = "Pesquisar por pacotes"
        searchBar.isTranslucent = true
        searchBar.barTintColor = .clear
        searchBar.backgroundColor = .clear
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setLayoutConstraintsSearchBar(){
        
        searchBar.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        listTrips = listWithAllTrips
        
        if searchText != "" {
            
            listTrips = listTrips.filter {$0.trip.title.contains(searchText)}
            
        }
        
        self.packagesFoundLabel.text = self.reloadCountLabel()
        collectionView.reloadData()
        
    }
    
    func reloadCountLabel() -> String {
        return listTrips.count == 1 ? "1 pacote encontrado" : "\(listTrips.count) pacotes encontrados"
    }
    
}
