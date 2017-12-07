//
//  NetworkManager.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON


class NetworkManager {
    
    var list: [Place]
    
    // Create Singleton Instance
    static let instance = NetworkManager()
    private init() {
        list = []
    }
    
    /*
     * Method used to create desired URL for data fetch
     */
    func createDataUrl(latitude: String, longitude: String) -> String {
        return "https://places.demo.api.here.com/places/v1/discover/around?Geolocation=geo%3A\(latitude)%2C\(longitude)&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg"
    }
    
    
    // MARK: - Data List
    
    func getData(completionHandler: @escaping ([Place]?, Error?) -> ()) {
        getDataCall(completionHandler: completionHandler)
    }
    
    func getDataCall(completionHandler: @escaping ([Place]?, Error?) -> ()) {
        let url = createDataUrl(latitude: "52.531", longitude: "13.3843")
        
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let jsonResponse = JSON(value)
                completionHandler(self.parseData(json: jsonResponse["results"] as JSON), nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    
    // MARK: - Parse Data
    
    func parseData(json: JSON) -> [Place] {
        
        for place in json["items"].array! {
            
            let category = place["category"] as JSON
            let placeCategory = category["title"].stringValue
            
            if categoryVerification(category: placeCategory) {
                let placePosition = convertJSONArrayToStringArray(jsonArray: place["position"].array!)
                let placeTitle = place["title"].stringValue
                let placeIcon = place["icon"].stringValue
                let placeVicinity = place["vicinity"].stringValue
                
                let placeListItem = Place(positionDetails: placePosition, title: placeTitle, category: placeCategory, icon: placeIcon, vicinity: placeVicinity)
                
                list.append(placeListItem)
            }
        }
        
        return list
    }
    
    
    // MARK: - Utils
    
    func categoryVerification(category: String) -> Bool {
        if(category == "Restaurant") {
                return true
        }
        return false
    }
    
    func convertJSONArrayToStringArray(jsonArray: [JSON]) -> [String] {
        var stringArray: [String] = []
        for item in jsonArray {
            stringArray.append(item.stringValue)
        }
        return stringArray
    }
}
