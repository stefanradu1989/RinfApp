//
//  DetailScreenViewController.swift
//  RinfApp
//
//  Created by Radu Stefan on 07/12/2017.
//  Copyright © 2017 RS. All rights reserved.
//

import UIKit
import MapKit


class DetailScreenViewController: UIViewController {
    
    var placeDetails: Place!
    
    var placeLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
    
    let regionRadius: CLLocationDistance = 1000
    
    
    // MARK: - IBOutlet/IBAction

    @IBOutlet weak var mapView: MKMapView!
    
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get coordinates
        let lat: Double = Double(placeDetails.positionDetails[0])!
        let long: Double = Double(placeDetails.positionDetails[1])!
        
        // create location from coordinates
        placeLocation = CLLocation(latitude: lat, longitude: long)
        
        
        centerMapOnLocation(location: placeLocation)
        
        // crate location for pin
        let placeLocationPin = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        // show pin on map
        let pin = Pin(title: placeDetails.title,
                              coordinate: placeLocationPin)
        mapView.addAnnotation(pin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - MapView

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}


// MARK: - Pin

class Pin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
}
