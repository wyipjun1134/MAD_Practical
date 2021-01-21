//
//  MapViewController.swift
//  Telegramme_week4
//
//  Created by Yip jun wei on 7/1/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString("535 Clementi Road Singapore 599489", completionHandler:
            {(p,e) in
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: p![0].location!.coordinate.latitude, longitude: p![0].location!.coordinate.longitude)
                annotation.title = "Ngee Ann Polytechnic"
                self.mapView.addAnnotation(annotation)
                
             //   let coord = CLLocationCoordinate2D(latitude: p![0].location!.coordinate.latitude, longitude: p![0].location!.coordinate.longitude)
            })
     
        
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate

        mapView.mapType = MKMapType.standard

       
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title = "Me"
        annotation.subtitle = "current location"
        mapView.addAnnotation(annotation)

        //centerMap(locValue)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
