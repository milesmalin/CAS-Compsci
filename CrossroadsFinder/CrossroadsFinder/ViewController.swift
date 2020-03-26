//
//  ViewController.swift
//  CrossroadsFinder
//
//  Created by Miles Malin on 3/23/20.
//  Copyright © 2020 Miles Malin. All rights reserved.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var crossroadsButton: UIButton!
    @IBOutlet weak var pyramidButton: UIButton!
    @IBOutlet weak var zuesButton: UIButton!
    
    @IBOutlet weak var crossroadsLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    let CROSSROADS_LAT = 34.024640
    let CROSSROADS_LONG = -118.473630
    
    let PYRAMID_LAT = 29.9792
    let PYRAMID_LONG = 31.1342
    
    let ZUES_LAT = 37.6360
    let ZUES_LONG = 21.6247
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendToCrossroads(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func sendToPyramid(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: PYRAMID_LAT, longitude: PYRAMID_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func sendToZeus(_ sender: Any) {
        mapView.delegate = self
        let point = MKMapPoint(CLLocationCoordinate2D(latitude: ZUES_LAT, longitude: ZUES_LONG))
        let size = MKMapSize(width: 1000, height: 1000)
        let rect = MKMapRect(origin: point, size: size)
        mapView.setRegion(MKCoordinateRegion(rect), animated: true)
    }
    
    @IBAction func zoomOut(_ sender: Any) {
        changeZoom(1)
    }
    
    @IBAction func zoomIn(_ sender: Any) {
        changeZoom(-1)
    }
    
    func changeZoom(_ exp: Double) {
        let region = mapView.region
        let newLat = region.span.latitudeDelta * pow(2, exp)
        let newLong = region.span.longitudeDelta * pow(2, exp)
        let newCoordinateSpan = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLong)
        let newRegion = MKCoordinateRegion(center: region.center, span: newCoordinateSpan)
        mapView.setRegion(newRegion, animated: true)
    }
    
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let rect = mapView.visibleMapRect
        let crossroadsLocation = CLLocationCoordinate2D(latitude: CROSSROADS_LAT, longitude: CROSSROADS_LONG)
        let crossroadsPoint = MKMapPoint(crossroadsLocation)
        
        let pyramidLocation = CLLocationCoordinate2D(latitude: PYRAMID_LAT, longitude: PYRAMID_LONG)
        let pyramidPoint = MKMapPoint(pyramidLocation)
        
        let zuesLocation = CLLocationCoordinate2D(latitude: ZUES_LAT, longitude: ZUES_LONG)
        let zuesPoint = MKMapPoint(zuesLocation)
        
        if rect.contains(crossroadsPoint) {
            crossroadsLabel.text = "It's Crossroads!"
        } else if rect.contains(pyramidPoint) {
            crossroadsLabel.text = "It's the Great Pyramid of Giza"
        } else if rect.contains(zuesPoint) {
            crossroadsLabel.text = "It's Zues"
        } else {
            crossroadsLabel.text = "?"
        }
    }
    
}
