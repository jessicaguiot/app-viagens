//
//  TripsCell.swift
//  app-viagens
//
//  Created by Jessica Guiot on 11/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit



//Demonstrate how to use UITableViewCell
class TripsCell: UITableViewCell {
    
    let tripImageView = UIImageView()
    let tripTitleLabel = UILabel()
    let numberOfDaysTripLabel = UILabel()
    let priceTripLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(tripTitleLabel)
        addSubview(tripImageView)
        addSubview(numberOfDaysTripLabel)
        addSubview(priceTripLabel)
        
        configureTitleLabel()
        configureImageView()
        configureNumberOfDaysTripLabel()
        configurePriceTripLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
        setNumberOfDaysTripLabelConstraints()
        setPriceTripLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set (Trip: Trips){
        self.tripImageView.image = Trip.tripImage
        self.tripTitleLabel.text = Trip.title
        self.numberOfDaysTripLabel.text = Trip.numberOfDays
        self.priceTripLabel.text = Trip.price
    }
    
    
    func configureImageView() {
        tripImageView.layer.cornerRadius = 10
        tripImageView.clipsToBounds      = true
        tripImageView.contentMode = .scaleAspectFill
    }
    
    func configureTitleLabel() {
        tripTitleLabel.numberOfLines = 0
        tripTitleLabel.adjustsFontSizeToFitWidth = true
        tripTitleLabel.font = UIFont.systemFont(ofSize: 20.0)
        tripTitleLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    func configureNumberOfDaysTripLabel() {
        numberOfDaysTripLabel.numberOfLines = 0
        numberOfDaysTripLabel.adjustsFontSizeToFitWidth = true
        numberOfDaysTripLabel.font = UIFont.systemFont(ofSize: 15.0)
        numberOfDaysTripLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    func configurePriceTripLabel() {
        priceTripLabel.numberOfLines = 0
        priceTripLabel.adjustsFontSizeToFitWidth = true
        priceTripLabel.font = UIFont.systemFont(ofSize: 15.0)
        priceTripLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    func setImageConstraints() {
        
        tripImageView.translatesAutoresizingMaskIntoConstraints = false
        tripImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive =  true
        tripImageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
    
    }
    
    func setTitleLabelConstraints(){
        tripTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tripTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        tripTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tripTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        
    }
    
    func setNumberOfDaysTripLabelConstraints(){
        numberOfDaysTripLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfDaysTripLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive =  true
        numberOfDaysTripLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        numberOfDaysTripLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 3).isActive = true
    }
    
    func setPriceTripLabelConstraints(){
        priceTripLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTripLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 140).isActive =  true
        priceTripLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 3).isActive = true
    }
}
