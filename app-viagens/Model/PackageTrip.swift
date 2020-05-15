//
//  PackageTrip.swift
//  app-viagens
//
//  Created by Jessica Guiot on 15/05/20.
//  Copyright © 2020 Jessica Guiot. All rights reserved.
//

import UIKit

class PackageTrip: NSObject {
    
    let hotelName: String
    let descriptionTrip: String
    let tripDate: String
    let trip: Trips
    
    init(hotelName:String, descriptionTrip: String, tripDate: String, trip: Trips){
        
        self.hotelName = hotelName
        self.descriptionTrip = descriptionTrip
        self.tripDate = tripDate
        self.trip = trip
    }

}
