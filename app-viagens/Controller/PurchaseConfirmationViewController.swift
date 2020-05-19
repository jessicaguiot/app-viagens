//
//  PurchaseConfirmationViewController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 18/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class PurchaseConfirmationViewController: UIViewController {
    
    let stackView = UIStackView()
    
    //MARK: - Views
    let headerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 247/255, green: 174/255, blue: 78/255, alpha: 1.0)
        return view
    }()
    
    let separatorView : UIView = {
        let view                                                        = UIView()
        view.backgroundColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints                  = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive       = true
        return view
    }()
    
    //MARK: - Labels
    let congratulationsLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Parabéns!".uppercased()
        label.font                        = UIFont.boldSystemFont(ofSize: 24)
        label.textColor                   = .white
        label.textAlignment               = .center
        
        return label
        
    }()
    
    let purchaseStatusLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Compra realizada com sucesso!"
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = .white
        label.textAlignment               = .center
        
        return label
        
    }()
    
    let resumePurchaseLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Confira o resumo da compra: "
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .center
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    let titleLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Porto de Galinhas".uppercased()
        label.font                        = UIFont.systemFont(ofSize: 23)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    let hotelNameLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Resort Porto de Galinhas"
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    let periodLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "8 ˜ 15 de agosto"
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    let numberOfPeopleLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "2 adultos"
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    let descripitonLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "Hotel + Café da Manhã"
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints              = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive  = true
        
        return label
        
    }()
    
    //MARK: - Image View
    
    let imageView : UIImageView = {
        let imageView                                                       = UIImageView()
        imageView.clipsToBounds                                             = true
        imageView.layer.cornerRadius                                        = 10
        imageView.translatesAutoresizingMaskIntoConstraints                 = false
        imageView.heightAnchor.constraint(equalToConstant: 130).isActive    = true
        imageView.contentMode                                               = .scaleToFill
        return imageView
    }()
    
    //MARK: - Buttons
    
    let backHomeButton: UIButton = {
        let button                                                      = UIButton()
        button.setTitle("voltar para home", for: .normal)
        button.backgroundColor = UIColor(red: 56/255, green: 182/255, blue: 224/255, alpha: 1.0)
        button.layer.cornerRadius                                       = 8
        button.translatesAutoresizingMaskIntoConstraints                = false
        button.heightAnchor.constraint(equalToConstant: 35).isActive    = true
        return button
    }()
    
    //MARK: - Atributos
    var buyPackage : PackageTrip? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureView()
        configureHeaderView()
        configureStackView()
        setBackHomeButtonTarget()
    }
    
    func configureView() {
        if let package = buyPackage {
            imageView.image         = package.trip.tripImage
            titleLabel.text         = package.trip.title.uppercased()
            hotelNameLabel.text     = package.hotelName
            periodLabel.text        = package.tripDate
            descripitonLabel.text   = package.descriptionTrip
        }
    }

    func configureStackView(){
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        setStackViewConstraints()
        addElementsToStackView()
    }
    
    func configureHeaderView(){
        view.addSubview(headerView)
        setHeaderViewConstraints()
        addElementsToHeaderView()
    }
    
    func setBackHomeButtonTarget(){
        backHomeButton.addTarget(self, action: #selector(backToHomeTappedButton), for: .touchUpInside)
        
    }
    
    @objc func backToHomeTappedButton(){
        navigationController?.popToRootViewController(animated: true)
    }
    
    func addElementsToHeaderView(){
        headerView.addSubview(congratulationsLabel)
        setLabelConstraints(label: congratulationsLabel, centerYConstant: -10)
        headerView.addSubview(purchaseStatusLabel)
        setLabelConstraints(label: purchaseStatusLabel, centerYConstant: 20)
    }
    
    func addElementsToStackView()  {
        stackView.addArrangedSubview(resumePurchaseLabel)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(hotelNameLabel)
        stackView.addArrangedSubview(periodLabel)
        stackView.addArrangedSubview(numberOfPeopleLabel)
        stackView.addArrangedSubview(descripitonLabel)
        stackView.addArrangedSubview(backHomeButton)
    }
    
    func setLabelConstraints(label: UILabel, centerYConstant: CGFloat){
        label.translatesAutoresizingMaskIntoConstraints                                         = false
        label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: centerYConstant).isActive = true
    }
    
    func setHeaderViewConstraints(){
        headerView.translatesAutoresizingMaskIntoConstraints                            = false
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive               = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive       = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive     = true
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive               = true
    }
    
    func setStackViewConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints                                        = false
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive                  = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive     = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive  = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive                     = false
    }
}
