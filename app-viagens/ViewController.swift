//
//  ViewController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 11/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Elements View
    
    var labelHeader: UILabel = {
        let label = UILabel()
        label.text = "alura viagens"
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var header: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    let buttonHotels = UIButton()
    let buttonPackages = UIButton()
    let tableView = UITableView()

    var listTrips : [Trips] = []
    
    
    struct Cells {
        
        static let tripsCell = "TripsCell"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTrips = fetchData()
        
        
        view.addSubview(header)
        view.sendSubviewToBack(header)
        view.addSubview(labelHeader)
        view.addSubview(buttonHotels)
        view.addSubview(buttonPackages)
        
        
        //set up the configs of the buttons
        setUpButtons(button: buttonHotels, color: .blue, title: "hóteis")
        setUpButtons(button: buttonPackages, color: .orange, title: "pacotes")
        
        
        //setando os auto layouts
        setUpLayoutHeader()
        setUpLayoutLabelHeader()
        setUpLayoutButtonHotels()
        setUpLayoutButtonPackages()
        
        
        //set the delegates
        tableView.dataSource = self
        tableView.delegate = self
        
        
        
        setUpTableView()
        
    }
    
    //Demonstrate how to use auto layout constraints
    func setUpLayoutHeader() {
        
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 145).isActive = true
        
    }
    
    func setUpLayoutLabelHeader() {
        
        labelHeader.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        labelHeader.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        labelHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 35).isActive = true
        labelHeader.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    func setUpLayoutButtonHotels(){
        
        buttonHotels.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonHotels.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonHotels.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80).isActive = true
        buttonHotels.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    }
    
    
    func setUpLayoutButtonPackages(){
        
        buttonPackages.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonPackages.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonPackages.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80).isActive = true
        buttonPackages.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
    }
    
    
    
    //Demonstrate how to use UIButton
    func setUpButtons(button: UIButton, color: UIColor, title: String) {
        //this enables the auto layout
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 10
    }
    
    
    //Demonstrate how to use UITableView
    func setUpTableView() {
        view.addSubview(tableView)
        
        tableView.rowHeight = 190
        
        
        //removing the separator
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: buttonHotels.bottomAnchor, constant: 20).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
        //registrando a celula 
        tableView.register(TripsCell.self, forCellReuseIdentifier: Cells.tripsCell)
    }
    
    

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listTrips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.tripsCell, for: indexPath) as! TripsCell
        
        cell.set(Trip: listTrips[indexPath.row])
    
        
        return cell
    }
    
    
}

extension ViewController {
    
    
    func fetchData() -> [Trips] {
        
        let ceara = Trips(title: "Ceará", numberOfDays: "3", price: "1.800,59", tripImage: UIImage(named:"img1")!)
        let rioDeJaneiro = Trips(title: "Rio de Janeiro", numberOfDays: "6", price: "1.800,59", tripImage: UIImage(named:"img2")!)
        
        return [ceara, rioDeJaneiro]
        
        
    }
    
}
