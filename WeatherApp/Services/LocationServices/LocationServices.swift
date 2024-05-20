//
//  LocationServices.swift
//  WeatherApp
//
//  Created by Naden on 19/05/2024.
//

import Foundation
import CoreLocation

class LocationServices : NSObject,  CLLocationManagerDelegate , ObservableObject {
    
    @Published var loactionCordinate : CLLocationCoordinate2D?
    
    static var instance = LocationServices()
    
    let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        loactionCordinate = locations.first?.coordinate
    }
    
  
}
