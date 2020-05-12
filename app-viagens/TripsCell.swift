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
        sendSubviewToBack(tripImageView)
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
        self.numberOfDaysTripLabel.text = "\(Trip.numberOfDays) dias"
        self.priceTripLabel.text = Trip.price
    }
    
    
    func configureImageView() {
        
        tripImageView.translatesAutoresizingMaskIntoConstraints = false
        tripImageView.layer.cornerRadius = 10
        tripImageView.clipsToBounds      = true
        tripImageView.contentMode = .scaleAspectFill
    }
    
    func configureTitleLabel() {
        
        tripTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        tripTitleLabel.numberOfLines = 0
        tripTitleLabel.adjustsFontSizeToFitWidth = true
        tripTitleLabel.font = UIFont.systemFont(ofSize: 20.0)
        tripTitleLabel.textAlignment = .left
        tripTitleLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    func configureNumberOfDaysTripLabel() {
        numberOfDaysTripLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numberOfDaysTripLabel.numberOfLines = 0
        numberOfDaysTripLabel.textAlignment = .left
        numberOfDaysTripLabel.adjustsFontSizeToFitWidth = true
        numberOfDaysTripLabel.font = UIFont.systemFont(ofSize: 15.0)
        numberOfDaysTripLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    func configurePriceTripLabel() {
        priceTripLabel.translatesAutoresizingMaskIntoConstraints = false
        priceTripLabel.numberOfLines = 0
        priceTripLabel.textAlignment = .right
        priceTripLabel.adjustsFontSizeToFitWidth = true
        priceTripLabel.font = UIFont.systemFont(ofSize: 15.0)
        priceTripLabel.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
    }
    
    
    // setting up layouts
    
    
    func setImageConstraints() {
        
        tripImageView.topAnchor.constraint(equalTo: tripTitleLabel.bottomAnchor, constant: 5).isActive = true
        tripImageView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        tripImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        tripImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    
    }
    
    func setTitleLabelConstraints(){
        
        tripTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -75).isActive = true
        tripTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        tripTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        
    }
    
    func setNumberOfDaysTripLabelConstraints(){
        
        numberOfDaysTripLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -88).isActive =  true
        numberOfDaysTripLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 5).isActive = true
        numberOfDaysTripLabel.rightAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    func setPriceTripLabelConstraints(){
        
        priceTripLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 88).isActive =  true
        priceTripLabel.topAnchor.constraint(equalTo: tripImageView.bottomAnchor, constant: 5).isActive = true
        priceTripLabel.leftAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

}
