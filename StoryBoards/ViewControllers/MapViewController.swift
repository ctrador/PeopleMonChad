//
//  MapViewController.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/9/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import UIKit
import MapKit
import MBProgressHUD
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var checkInButton: UIButton!
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager()
    var updatingLocation = true
    let latitudeDelta = 0.005
    let longitudeDelta = 0.005
    var annotations: [MapPin] = []
    var overlay : MKOverlay?
    var updateLocation = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        mapView.showsUserLocation = true
        locationManager.stopUpdatingLocation()
        locationManager.delegate = self
        mapView.delegate = self
        UserStore.shared.delegate = self
        loadMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !WebServices.shared.userAuthTokenExists() || WebServices.shared.userAuthTokenExpired() {
            performSegue(withIdentifier: "presentLoginNoAnimation", sender: self)
        } else {
            let infoUser = Account()
            WebServices.shared.getObject(infoUser, completion: { (user, error) in
                if let user = user {
                    UserStore.shared.account = user
                }
            })
        }
    }
    
    
    func  loadMap() {
        if let coordinate = locationManager.location?.coordinate{
            let checkin = User(coordinate: coordinate)
            WebServices.shared.postObject(checkin, completion: { (object, error) in })
            
        }
        
        let nearby = User(radius: Constants.radius)
        WebServices.shared.getObjects(nearby) { (objects, error) in
            if let objects = objects {
                let oldAnnotations = self.annotations
                self.annotations = []
                for user in objects {
                    let pin = MapPin(user: user)
                    self.annotations.append(pin)
                }
                self.mapView.addAnnotations(self.annotations)
                self.mapView.removeAnnotations(oldAnnotations)
            }
        }
    }
    
    //Mark - @IBActions
    
    @IBAction func logout(_ sender: Any) {
        UserStore.shared.logout{
            self.performSegue(withIdentifier: "PresentLogin", sender: self)
        }
        
    }
    
    
    @IBAction func mapType(_ sender: Any) {
        if mapView.mapType == MKMapType.standard {
            mapView.mapType = MKMapType.satellite
        } else {
            mapView.mapType = MKMapType.standard
        }
    } 
    
    
    
    
    
    @IBAction func snowProfile(_ sender: Any) {
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// Mark: - Extensions



extension MapViewController {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpanMake(latitudeDelta, longitudeDelta))
        mapView.setRegion(region, animated: true)
        updateLocation = true
        locationManager.stopUpdatingLocation()
    }
}


extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = false
            pinView!.animatesDrop = false
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let mapPin = view.annotation as? MapPin, let people = mapPin.user, let name = people.userName, let userId = people.userId {
            let alert = UIAlertController(title: "Catch User", message: "Catch \(name)?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Catch", style: .default, handler: { (action) in
                let catchPeople = People(userId: userId, radiusInMeters: Constants.radius)
                WebServices.shared.postObject(catchPeople, completion: { (object, error) in
                    if let error = error {
                        self.present(Utils.createAlert(message: error), animated: true, completion: nil)
                    } else {
                        self.present(Utils.createAlert("Congrats", message: "User Caught"), animated: true, completion: nil)
                    }
                })
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}


extension MapViewController: UserStoreDelegate {
    func userLoggedIn() {
        
    }
}
