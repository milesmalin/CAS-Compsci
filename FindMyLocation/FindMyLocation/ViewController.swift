//
//  ViewController.swift
//  FindMyLocation
//
//  Created by Miles Malin on 3/27/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var map: MKMapView!
    
    
    
    var locationManager: CLLocationManager!
      
      let CROSSROADS_LAT = 34.0240892
      let CROSSROADS_LONG = -118.4747321
      
    var dist: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
         distanceLabel.text = "How far are is Crossroads?"
        locationManager = CLLocationManager()
               locationManager.delegate = self
               locationManager.requestWhenInUseAuthorization()
               map.delegate = self
               let xrdsCoordinate = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
               let point = MKMapPoint(xrdsCoordinate)
               let size = MKMapSize(width: 1000, height: 1000)
               let rect = MKMapRect(origin: point, size: size)
               map.setRegion(MKCoordinateRegion(rect), animated: true)
        
    }

    @IBAction func ZoomOut(_ sender: Any) {
        zoom(1)
    }
    
    
    @IBAction func ZoomIn(_ sender: Any) {
        zoom(-1)
    }
    
    func zoom(_ exp: Double) {
        /*
        // Uses MKMapRect to create and set region
        let factor = pow(2, exp)
        let rect = mapView.visibleMapRect
        let newSize = MKMapSize(width: rect.width * factor, height: rect.height * factor)
        let newRect = MKMapRect(origin: rect.origin, size: newSize)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        */
        // Uses MKCoordinateSpan to create and set region
        let region = map.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        map.setRegion(newRegion, animated: true)
    }
    
    
    @IBAction func findLocation(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let crossroadsLoc = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLoc)
        if rect.contains(crossroadsPoint) {
            label.text = "You found Crossroads!"
        } else {
           label.text = "Where's Crossroads?"
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = map.region.span
        print(span)
        let coords = locations.suffix(1)[0].coordinate
        let newRegion = MKCoordinateRegion(center: coords, span: span)
        map.setRegion(newRegion, animated: true)
        
        
        
        let personalLat = coords.latitude
        let personalLong = coords.longitude
        
        let firstLoc = CLLocation(latitude: personalLat, longitude: personalLong)
        let secondLoc = CLLocation(latitude: CROSSROADS_LAT,longitude: CROSSROADS_LONG)
       
        dist = firstLoc.distance(from: secondLoc) * 0.000621371
        distanceLabel.text = "You are \(Int(dist!)) from Xrds, Would you like directions?"

     
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    
    
    
    
    
    

}
