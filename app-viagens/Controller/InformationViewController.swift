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
    let priceVerticalStackView = UIStackView()
    let textFieldStackView = UIStackView()
    
    //MARK: - Scroll view
    let scrollView = UIScrollView()
    
    //MARK: - Header Elements
    let headerImageView = UIImageView()
    
    let titlelabeL: UILabel = {
        
        let label = UILabel()
        label.text = "PORTO DE GALINHAS"
        label.font = UIFont.boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
    }()
    
    let numberDaysLabel : UILabel = {
        
        let label = UILabel()
        label.text = "7 dias"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
        
    }()
    
    let packageInformationLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Pacotes: Hotel +  café da manhã"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        return label
        
    }()
    
    //MARK: - Labels of first horizontal stack view
    let periodLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "válido para o período de: "
        label.font                        = UIFont.systemFont(ofSize: 15)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.numberOfLines               = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
        
    }()
    
    let sinceLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "a partir de:"
        label.font                        = UIFont.systemFont(ofSize: 15)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .right
        
        return label
        
    }()
    
    let priceLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "R$ 2.490,99"
        label.numberOfLines               = 0
        label.font                        = UIFont.systemFont(ofSize: 20)
        label.textColor                   = .green
        label.textAlignment               = .right
        
        return label
        
    }()
    
    
    let includLabel : UILabel = {
        
        let label                         = UILabel()
        label.text                        = "o que está incluso: "
        label.font                        = UIFont.systemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        return label
        
    }()
    
    //MARK: - Elements of the vertical icons stack view
    
    struct includedThings {
        
        let viewIcons: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints                 = false
            view.heightAnchor.constraint(equalToConstant: 80).isActive     = true
            return view
        }()
        
        
        let iconsImageView : UIImageView = {
            
            let imageView = UIImageView()
            imageView.contentMode = .scaleToFill
            
            imageView.translatesAutoresizingMaskIntoConstraints                 = false
            imageView.heightAnchor.constraint(equalToConstant: 40).isActive     = true
            imageView.widthAnchor.constraint(equalToConstant: 40).isActive      = true
           
            return imageView
        }()
        
        let iconsLabel : UILabel = {
            
            let label                         = UILabel()
            
            label.text                        = "Icons"
            label.font                        = UIFont.systemFont(ofSize: 14)
            label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
            label.textAlignment               = .center
            label.numberOfLines               = 0
            
            
            label.translatesAutoresizingMaskIntoConstraints                 = false
            label.heightAnchor.constraint(equalToConstant: 21).isActive     = true
            
            return label
            
        }()
        
        mutating func addItemsToView(nameIcon: String, icon: Icon){
            
            iconsImageView.image    = UIImage(named: icon.rawValue)
            iconsLabel.text         = nameIcon
            
            
            viewIcons.addSubview(iconsImageView)
            viewIcons.addSubview(iconsLabel)
        }
        
    }
    
    
    
    
    //MARK: - Elements of the payment section
    let cardLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.text                        = "CARTÃO DE CRÉDITO"
        label.font                        = UIFont.boldSystemFont(ofSize: 17)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        return label
        
    }()
    
    
    let numberOfCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.placeholder = " Número do cartão"
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return textField
    }()
    
    
    let nameInCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.placeholder = " Nome no cartão"
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return textField
    }()
    
    
    let dateOfCardTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.placeholder = " Data de validade do cartão"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 6
        textField.placeholder = " Digite a senha do cartão"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return textField
    }()
    
    let endBuyButton =  UIButton()
    
    let backButton: UIButton = {
        
        let button = UIButton()
        
        //button.setTitle("chevron.left", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .white
        
        return button
        
    }()
    
    let separator1 : UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
        
        
    }()
       
    let separator2 : UIView = {
        
        let view = UIView()
        
        view.backgroundColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
        
        
    }()
    
    
    //MARK: - Atributos
    
    var packageSelected: PackageTrip? = nil
    
    enum Icon: String {
        
        case Airplane = "icon_airplane"
        case Breakfast = "icon_breakfast"
        case Hotel = "icon_hotel"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.sendSubviewToBack(rootVerticalStackView)
        configureImageView()
        setScrollView()
        
        // saber quando o teclado vai subir
        NotificationCenter.default.addObserver(self, selector: #selector(aumentaScrollView(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        
        configureRootVerticalStackView()
        configureLabelsHorizontalStackView()
        configureIncludedItemsHorizontalStackView()
        setRootVerticalStackViewConstraints()
        
        configureItemsOneVerticalStackView()
        configureItemsTwoVerticalStackView()
        configureItemsThreeVerticalStackView()
        configureTextFieldStackItems()
        
        configureButton()
        
        addElementsToRootVerticalStackView()
        addElementsToIncludedItemsHorizontalStackView()
        addElementsToLabelsHorizontalStackView()
        addElementsToItemsOneVerticalStackView()
        addElementsToItemsTwoVerticalStackView()
        addElementsToItemsThreeVerticalStackView()
        addElementsToTextFieldStackView()
        
        
        setPackage()
        
        view.addSubview(backButton)
        targetButton()
        setBackButtonConstraints()
    }
    
    @objc func aumentaScrollView(notification: Notification){
        scrollView.contentOffset.y = 200
    }
    
    func setScrollView(){
        view.addSubview(scrollView)
        setUpScollViewConstraints()
        scrollView.addSubview(rootVerticalStackView)
    }
    
    func setUpScollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 10).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
    }
    
    func setPackage(){
        guard let package = packageSelected else {return}
        
        self.headerImageView.image                       = package.trip.tripImage
        self.titlelabeL.text                             = package.trip.title
        self.packageInformationLabel.text                = package.descriptionTrip
        self.numberDaysLabel.text                        = package.trip.numberOfDays
        self.periodLabel.text                            = "válido para o período de: \(package.tripDate)"
        self.priceLabel.text                             = package.trip.price
        
    }
    
    func targetButton(){
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
    }
    
    @objc func back(){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //MARK: - Configure methods
    
    func configureButton(){
        
        endBuyButton.setTitle("finalizar compra", for: .normal)
        endBuyButton.backgroundColor = .orange
        endBuyButton.layer.cornerRadius = 6
        endBuyButton.translatesAutoresizingMaskIntoConstraints = false
        endBuyButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    
    func configureImageView() {
        
        view.addSubview(headerImageView)
        view.sendSubviewToBack(headerImageView)
        
        headerImageView.clipsToBounds = true
        headerImageView.contentMode = .scaleToFill
        
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.heightAnchor.constraint(equalToConstant: 185).isActive =  true
        headerImageView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        headerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        headerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    }
    
    
    func configureRootVerticalStackView(){
    
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
           includedItemsHorizontalStackView.spacing       = 20
    }
    
    func configureItemsOneVerticalStackView(){
    
        itemsVerticalOneStackView.axis          = .vertical
        itemsVerticalOneStackView.distribution  = .fill
        itemsVerticalOneStackView.spacing       = 5
        
    }
    
    func configureItemsTwoVerticalStackView(){
    
        itemsVerticalTwoStackView.axis          = .vertical
        itemsVerticalTwoStackView.distribution  = .fill
        itemsVerticalTwoStackView.spacing       = 5
        
    }
    
    func configureItemsThreeVerticalStackView(){
    
        itemsVerticalThreeStackView.axis          = .vertical
        itemsVerticalThreeStackView.distribution  = .fill
        itemsVerticalThreeStackView.spacing       = 5
        
    }
    
    func configureTextFieldStackItems(){
        
        textFieldStackView.axis          = .vertical
        textFieldStackView.distribution  = .fill
        textFieldStackView.spacing       = 12
    }
    
    
    //MARK: - Adding elemetns in stack views methods
    
    func addElementsToRootVerticalStackView(){

        rootVerticalStackView.addArrangedSubview(titlelabeL)
        rootVerticalStackView.addArrangedSubview(packageInformationLabel)
        rootVerticalStackView.addArrangedSubview(numberDaysLabel)
        rootVerticalStackView.addArrangedSubview(labelsHorizontalStackView)
        rootVerticalStackView.addArrangedSubview(separator1)
        rootVerticalStackView.addArrangedSubview(includLabel)
        rootVerticalStackView.addArrangedSubview(includedItemsHorizontalStackView)
        rootVerticalStackView.addArrangedSubview(separator2)
        rootVerticalStackView.addArrangedSubview(cardLabel)
        rootVerticalStackView.addArrangedSubview(textFieldStackView)
        rootVerticalStackView.addArrangedSubview(endBuyButton)
        
    }
    
    func addElementsToLabelsHorizontalStackView(){
        
        
        priceVerticalStackView.axis = .vertical
        priceVerticalStackView.distribution = .fill
        priceVerticalStackView.addArrangedSubview(sinceLabel)
        priceVerticalStackView.addArrangedSubview(priceLabel)
        
        labelsHorizontalStackView.addArrangedSubview(periodLabel)
        labelsHorizontalStackView.addArrangedSubview(priceVerticalStackView)
        
    }
    
    func addElementsToItemsOneVerticalStackView(){
            
        var iconsOne = includedThings()
    
        iconsOne.addItemsToView(nameIcon: "Avião", icon: Icon.Airplane)
        setConstrainsIcons(icon: iconsOne)
        
        itemsVerticalOneStackView.addArrangedSubview(iconsOne.viewIcons)
        
        
    }
    
    
    func addElementsToItemsTwoVerticalStackView(){
            
        var iconsTwo = includedThings()
        
        iconsTwo.addItemsToView(nameIcon: "Café da Manhã", icon: Icon.Breakfast)
        setConstrainsIcons(icon: iconsTwo)
        
        itemsVerticalTwoStackView.addArrangedSubview(iconsTwo.viewIcons)
        
        
    }
    
    func addElementsToItemsThreeVerticalStackView(){
            
        var iconsThree = includedThings()
        
        iconsThree.addItemsToView(nameIcon: "Hotel", icon: Icon.Hotel)
        setConstrainsIcons(icon: iconsThree)
        
        itemsVerticalThreeStackView.addArrangedSubview(iconsThree.viewIcons)
        
        
    }
    
    
    func addElementsToTextFieldStackView(){
        textFieldStackView.addArrangedSubview(numberOfCardTextField)
        textFieldStackView.addArrangedSubview(nameInCardTextField)
        textFieldStackView.addArrangedSubview(dateOfCardTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
    }
    
    func setConstrainsIcons(icon: includedThings){
        
        
        icon.iconsImageView.centerYAnchor.constraint(equalTo: icon.viewIcons.centerYAnchor, constant: -15).isActive = true
        icon.iconsImageView.centerXAnchor.constraint(equalTo: icon.viewIcons.centerXAnchor, constant: 0).isActive = true
        
        icon.iconsLabel.centerYAnchor.constraint(equalTo: icon.viewIcons.centerYAnchor, constant: 25).isActive = true
        icon.iconsLabel.centerXAnchor.constraint(equalTo: icon.viewIcons.centerXAnchor, constant: 0).isActive = true
        
    }
    
    func addElementsToIncludedItemsHorizontalStackView(){
        
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalOneStackView)
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalTwoStackView)
        includedItemsHorizontalStackView.addArrangedSubview(itemsVerticalThreeStackView)
        
    }
    
    
    //MARK: - Constraints
    
    func setRootVerticalStackViewConstraints(){
        rootVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        rootVerticalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        rootVerticalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        rootVerticalStackView.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 20).isActive = true
        rootVerticalStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 0).isActive = true
    }
    
    func setBackButtonConstraints(){
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -170).isActive  = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -290).isActive  = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive                           = true
        backButton.widthAnchor.constraint(equalToConstant: 30).isActive                            = true
    }
    
    
}
