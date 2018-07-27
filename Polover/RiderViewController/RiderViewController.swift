//
//  RiderViewController.swift
//  Polover
//
//  Created by Maze Geek on 7/27/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class RiderViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var callForRide: UIButton!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // Location manager func going to Find users location
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate =  manager.location?.coordinate{
           let center =  CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
           let region = MKCoordinateRegion.init(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.02))
            map.setRegion(region, animated: true)
            
            map.removeAnnotations(map.annotations)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = center
            annotation.title = "Your Location"
            map.addAnnotation(annotation)
        }
    }

    @IBAction func callForRideButton(_ sender: UIButton) {
    }
   
    @IBAction func logOutButtonTapped(_ sender: Any) {
    
    }
    
    

    

}
