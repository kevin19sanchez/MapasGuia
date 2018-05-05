//
//  ViewController.swift
//  MAPAS
//
//  Created by kevin on 20/4/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import UIKit
import MapKit
import Foundation

class ViewController: UIViewController,MKMapViewDelegate{

    
    @IBOutlet weak var mapview: MKMapView!
    
    @IBOutlet weak var MapTySeg: UISegmentedControl!
    
    var locationManager = CLLocationManager()
    
    let initiaLocation = CLLocation(latitude: 13.7371443, longitude: -89.290824)
    
    let regionRadius: CLLocationDistance = 500000
    
    var points:[CLLocationCoordinate2D] = [CLLocationCoordinate2D]()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapview.delegate = self
        
        let places = Places();
        
        for tmp in places.placeList {
            mapview.addAnnotation(tmp)
            points.append(tmp.coordinate)
        }
        
        //notese el suo del &
        let polyline = MKPolyline(coordinates: &points, count: points.count)
        
        let circle = MKCircle(center: initiaLocation.coordinate, radius: 10000)
        
        let polygon = MKPolygon(coordinates: &places.polygonList, count: places.polygonList.count)
        
        
        
        mapview.add(polyline)
        
        mapview.add(circle)
        
        mapview.add(polygon)
        
        centerMapOnLocation(location: initiaLocation)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        self.checkLocationAuthorization()
    }
    
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        
        mapview.setRegion(coordinateRegion, animated: true)
    }
    
    func checkLocationAuthorization(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapview.showsUserLocation = true
        }else{
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    @IBAction func segmentChanged(sender: AnyObject) {
        switch MapTySeg.selectedSegmentIndex
        {
        case  0:
            mapview.mapType = MKMapType.standard
        case  1:
            mapview.mapType = MKMapType.satellite
        case  2:
            mapview.mapType = MKMapType.hybrid
            
        default: break
            
            
        }
    }
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        
        var render:MKOverlayRenderer = MKOverlayRenderer()
        if let overlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(circle: overlay)
            circleRenderer.fillColor = UIColor(red: 129, green: 182, blue: 239, alpha: 0.7)
            render = circleRenderer
        }
        
        if let overlay = overlay as? MKPolyline {
            let polylineRenderer = MKPolylineRenderer(polyline: overlay)
            polylineRenderer.strokeColor =  UIColor.red
            polylineRenderer.lineWidth = 2
            render = polylineRenderer
        }
        
        
        if let overlay = overlay as? MKPolygon {
            let polylineRenderer = MKPolygonRenderer(polygon: overlay)
            polylineRenderer.strokeColor =  UIColor.yellow
            polylineRenderer.lineWidth = 1
            polylineRenderer.fillColor = UIColor(red: 255, green: 252, blue: 219, alpha: 0.5)
            render = polylineRenderer
        }
        
        return render;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

