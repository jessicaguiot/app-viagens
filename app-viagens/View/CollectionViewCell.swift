//
//  CollectionViewCell.swift
//  app-viagens
//
//  Created by Jessica Guiot on 13/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    //MARK: - Elements
    
    let packageImageView: UIImageView = {
        
        let imageView                                                     = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints               = false
        imageView.contentMode                                             = .scaleToFill
        
        
        return imageView
        
    }()
    
    let titleLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.font                        = UIFont.systemFont(ofSize: 12)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
       
        return label
        
    }()
    
    
    let numberOfDaysLabel: UILabel = {
        
        let label                         = UILabel()
        
        label.font                        = UIFont.systemFont(ofSize: 11)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    
    let priceLabel : UILabel = {
        
        let label                         = UILabel()
        
        label.font                        = UIFont.systemFont(ofSize: 11)
        label.textColor                   = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.textAlignment               = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        
        addSubview(packageImageView)
        addSubview(titleLabel)
        addSubview(numberOfDaysLabel)
        addSubview(priceLabel)
        
        setImageViewConstraints()
        setTitleLabelConstraints()
        setNumbeOfDaysLabelConstraints()
        setPriceLabelConstraints()
    
    }

    
    
    func setInformationCell (Trip: Trips){
        self.packageImageView.image = Trip.tripImage
        self.titleLabel.text = Trip.title
        self.numberOfDaysLabel.text = "\(Trip.numberOfDays) dias"
        self.priceLabel.text = "R$ \(Trip.price)"
    }
    
    func configureCell(){
        
        self.layer.borderWidth  = 0.5
        self.layer.borderColor  = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0).cgColor
        self.layer.cornerRadius = 8
        self.clipsToBounds      = true
        self.sendSubviewToBack(packageImageView)
    }
    
    //MARK: - Constraints
    
    func setImageViewConstraints(){
        
        packageImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive            = true
        packageImageView.heightAnchor.constraint(equalToConstant: 100).isActive                    = true
        packageImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive  = true
        packageImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive    = true
        
    }
    
    func setTitleLabelConstraints(){
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive    = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive  = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 30).isActive   = true
        
    }
    
    func setNumbeOfDaysLabelConstraints(){
        
        numberOfDaysLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive   = true
        numberOfDaysLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        numberOfDaysLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 50).isActive                = true
    }
    
    func setPriceLabelConstraints(){
        
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive   = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        priceLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 70).isActive = true
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
