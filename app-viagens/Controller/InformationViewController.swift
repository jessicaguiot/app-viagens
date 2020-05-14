//
//  InformationViewController.swift
//  app-viagens
//
//  Created by Jessica Guiot on 14/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {
    
    //setting stack views
    let rootVerticalStackView = UIStackView()
    let labelsHorizontalStackView = UIStackView()
    let includedItemsHorizontalStackView = UIStackView()
    
    let itemsVerticalOneStackView = UIStackView()
    let itemsVerticalTwoStackView = UIStackView()
    let itemsVerticalThreeStackView = UIStackView()
    
    //MARK: - Header Elements
    let headerImageView = UIImageView()
    
    let titlelabeL: UILabel = {
        
        let label = UILabel()
        label.text = "PORTO DE GALINHAS"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        return label
    }()
    
    let numberDaysLabel : UILabel = {
        
        let label = UILabel()
        label.text = "7 dias"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
        
    }()
    
    let packageInformationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Pacotes: Hotel +  café da manhã"
        label.font = UIFont.systemFont(ofSize: 17)
        return label
        
    }()
    
    //MARK: - Labels of first horizontal stack view
    let periodLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "válido para o período de: "
        label.font                        = UIFont.systemFont(ofSize: 12)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        
        return label
        
    }()
    
    let priceLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "a partir de: R$ 2.490,99"
        label.numberOfLines               = 0
        label.font                        = UIFont.systemFont(ofSize: 12)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .right
        
        return label
        
    }()
    
    
    let includLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "o que está incluso: "
        label.font                        = UIFont.systemFont(ofSize: 12)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        
        return label
        
    }()
    
    //MARK: - Elements of the vertical icons stack view
    
    struct includedThings {
        
        let iconsImageView = UIImageView()
        let iconsLabel : UILabel = {
            
            let label                         = UILabel()
            
            label.text                        = "Icons"
            label.font                        = UIFont.systemFont(ofSize: 12)
            label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
            label.textAlignment               = .center
            
            return label
            
        }()
        
    }
    
    
    
    
    //MARK: - Elements of the payment section
    let cardLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "CARTÃO DE CRÉDITO"
        label.font                        = UIFont.systemFont(ofSize: 12)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .center
        
        return label
        
    }()
    
    
    let numberOfCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
    
        return textField
    }()
    
    
    let nameInCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
    
        return textField
    }()
    
    
    let dateOfCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.black.cgColor
    
        return textField
    }()
    
    
    let endBuyButton =  UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
       
        
        configureRootVerticalStackView()
        configureLabelsHorizontalStackView()
        configureIncludedItemsHorizontalStackView()
        
        
        configureItemsOneVerticalStackView()
        configureItemsTwoVerticalStackView()
        configureItemsThreeVerticalStackView()
        
        configureImageView()
        configureButton()
        
        addElementsToRootVerticalStackView()
        addElementsToIncludedItemsHorizontalStackView()
        addElementsToLabelsHorizontalStackView()
        addElementsToItemsOneVerticalStackView()
        addElementsToItemsTwoVerticalStackView()
        addElementsToItemsThreeVerticalStackView()
        
        setRootVerticalStackViewConstraints()
    }
    
    //MARK: - Configure methods
    
    func configureButton(){
        
        endBuyButton.setTitle("finalizar compra", for: .normal)
        endBuyButton.backgroundColor = .black
        
    }
    
    
    func configureImageView() {
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.heightAnchor.constraint(equalToConstant: 185).isActive =  true
        
    }
    
    
    func configureRootVerticalStackView(){
        
        view.addSubview(rootVerticalStackView)
        rootVerticalStackView.axis          = .vertical
        rootVerticalStackView.distribution  = .fill
        rootVerticalStackView.spacing       = 15
        
    }
    
    func configureLabelsHorizontalStackView(){
           
        
           labelsHorizontalStackView.axis          = .horizontal
           labelsHorizontalStackView.distribution  = .fill
           labelsHorizontalStackView.spacing       = 15
    }
    
    func configureIncludedItemsHorizontalStackView(){
           
           includedItemsHorizontalStackView.axis          = .horizontal
           includedItemsHorizontalStackView.distribution  = .fillEqually
           includedItemsHorizontalStackView.spacing       = 5
    }
    
    func configureItemsOneVerticalStackView(){
    
        itemsVerticalOneStackView.axis          = .vertical
        itemsVerticalOneStackView.distribution  = .fill
        itemsVerticalOneStackView.spacing       = 15
        
    }
    
    func configureItemsTwoVerticalStackView(){
    
        itemsVerticalTwoStackView.axis          = .vertical
        itemsVerticalTwoStackView.distribution  = .fill
        itemsVerticalTwoStackView.spacing       = 15
        
    }
    
    func configureItemsThreeVerticalStackView(){
    
        itemsVerticalThreeStackView.axis          = .vertical
        itemsVerticalThreeStackView.distribution  = .fill
        itemsVerticalThreeStackView.spacing       = 15
        
    }
    
    
    //MARK: - Adding elemetns in stack views methods
    
    func addElementsToRootVerticalStackView(){
        
        //header
        rootVerticalStackView.addArrangedSubview(headerImageView)
        rootVerticalStackView.addArrangedSubview(titlelabeL)
        rootVerticalStackView.addArrangedSubview(packageInformationLabel)
        rootVerticalStackView.addArrangedSubview(numberDaysLabel)
        
        //informations
        rootVerticalStackView.addArrangedSubview(labelsHorizontalStackView)
        rootVerticalStackView.addArrangedSubview(includLabel)
        rootVerticalStackView.addArrangedSubview(includedItemsHorizontalStackView)
        
        //payments
        rootVerticalStackView.addArrangedSubview(cardLabel)
        rootVerticalStackView.addArrangedSubview(numberOfCardTextField)
        rootVerticalStackView.addArrangedSubview(nameInCardTextField)
        rootVerticalStackView.addArrangedSubview(dateOfCardTextField)
        rootVerticalStackView.addArrangedSubview(endBuyButton)
        
    }
    
    func addElementsToLabelsHorizontalStackView(){
        
        labelsHorizontalStackView.addArrangedSubview(periodLabel)
        labelsHorizontalStackView.addArrangedSubview(priceLabel)
        
    }
    
    func addElementsToItemsOneVerticalStackView(){
            
        let iconsOne = includedThings()

        itemsVerticalOneStackView.addArrangedSubview(iconsOne.iconsImageView)
        itemsVerticalOneStackView.addArrangedSubview(iconsOne.iconsLabel)
        
    }
    
    
    func addElementsToItemsTwoVerticalStackView(){
            
        let iconsTwo = includedThings()

        itemsVerticalTwoStackView.addArrangedSubview(iconsTwo.iconsImageView)
        itemsVerticalTwoStackView.addArrangedSubview(iconsTwo.iconsLabel)
        
    }
    
    func addElementsToItemsThreeVerticalStackView(){
            
        let iconsThree = includedThings()

        itemsVerticalThreeStackView.addArrangedSubview(iconsThree.iconsImageView)
        itemsVerticalThreeStackView.addArrangedSubview(iconsThree.iconsLabel)
        
    }
    
    func addElementsToIncludedItemsHorizontalStackView(){
        
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalOneStackView)
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalTwoStackView)
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalThreeStackView)
        
    }
    
    
    //MARK: - Constraints
    
    func setRootVerticalStackViewConstraints(){
        rootVerticalStackView.translatesAutoresizingMaskIntoConstraints                                       = false
        rootVerticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive            = true
        rootVerticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive    = true
        rootVerticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        rootVerticalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
    
}
