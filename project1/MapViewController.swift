//
//  MapViewController.swift
//  project1
//
//  Created by Sena Nur Sari on 3/19/22.
//
import UIKit

import Foundation
import MapKit
import CoreLocation


class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var bankMap: MKMapView!
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var addressTF: UITextField!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func onGoClicked(_ sender: Any) {
        showInitialMap()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.manager = manager
        
        
    }
    
    
    
    
    func showInitialMap() {
        let clGeocoder = CLGeocoder();
        
        CLGeocoder().geocodeAddressString(addressTF.text!, completionHandler:
                                            { [self](placemarks, error) in
                
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let myCoordinations = location!.coordinate
                    let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                    self.bankMap.setRegion(region, animated: true)
                    let mkPointAnnotations = MKPointAnnotation()
                    mkPointAnnotations.coordinate = placemark.location!.coordinate
                    mkPointAnnotations.title = placemark.locality
                    mkPointAnnotations.subtitle = placemark.subLocality
                    self.bankMap.addAnnotation(mkPointAnnotations)
                    let request = MKLocalSearch.Request()
                    request.naturalLanguageQuery = " banks"
                    request.region = self.bankMap.region
                    let search = MKLocalSearch(request: request)
                    
                    search.start { response, _ in
                        guard let response = response else {
                            return
                        }
                        self.bankMap.removeAnnotations(self.bankMap.annotations)
                        
                        var mkMapItems = [MKMapItem]()
                        mkMapItems = response.mapItems
                        for i in 0...mkMapItems.count - 1 {
                            print(i)
                            let place = mkMapItems[i].placemark
                            let otherLocations = MKPointAnnotation()
                            otherLocations.coordinate = place.location!.coordinate
                            otherLocations.title = place.name
                            otherLocations.subtitle = place.subLocality
                            self.bankMap.addAnnotation(otherLocations)

                        }
                    }
                }
        })
    }
    
}
