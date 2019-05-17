//
//  Page4ViewController.swift
//  Registration Page
//
//  Created by olli on 11.04.19.
//  Copyright © 2019 Oli Poli. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var cityTextField: UITextField!
    
    var user: User?
    let backgroundImageView = UIImageView()
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        setImagesForBackground()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        print(location.altitude)
        print(location.speed)
        
        self.mapView.showsUserLocation = true
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            
            if error != nil {
                print ("THERE WAS AN ERROR")
            } else {
                if let place = placemark?[0] {
                    if let checker = place.country {
                        self.label.text! = "\(place.locality!), \(place.country!)"
                        
                        if self.label.text!.count > 0 {
                            self.cityTextField.isUserInteractionEnabled = false
                        }
                            
                        print(checker)
                    }
                }
            }
        }
        self.manager.stopUpdatingLocation()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: PhotoAndCameraViewController = segue.destination as! PhotoAndCameraViewController
        
        if self.label.text!.count > 0 {
            user?.city = label.text!
        } else if cityTextField.text!.count > 0 {
            user?.city = cityTextField.text!
        }
        destViewController.user = user
    }
    
    func setImagesForBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "1x")
        view.sendSubviewToBack(backgroundImageView)
    }
}

