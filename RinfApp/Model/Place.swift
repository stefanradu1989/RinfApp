//
//  Restaurant.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation


// Struct used for capturing data for a Person
struct Place: Codable {
    
    var positionDetails: [String]
    var title: String
    var category: String
    var icon: String
    var vicinity: String
    
    init(positionDetails: [String], title: String, category: String, icon: String, vicinity: String) {
        
        self.positionDetails = positionDetails
        self.title = title
        self.category = category
        self.icon = icon
        self.vicinity = vicinity
    }
}
