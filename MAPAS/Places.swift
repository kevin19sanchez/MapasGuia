//
//  Places.swift
//  MAPAS
//
//  Created by kevin on 20/4/18.
//  Copyright © 2018 kevin. All rights reserved.
//

import Foundation
import MapKit

class Places {
    var placeList = [MKPointAnnotation]();
    var annotation = MKPointAnnotation()
    
    var polygonList = [CLLocationCoordinate2D]();
    
    init() {
        addAnnotations()
        addPoints()
    }
 
    func addAnnotations() {
        annotation.coordinate = CLLocation(latitude: 13.5967436, longitude: -88.8725195).coordinate
        annotation.title = "Volcan de San Vicente"
        annotation.subtitle="El Chinchontepec"
        
        placeList.append(annotation);
        
        annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocation(latitude: 13.8053705, longitude: -89.6699631).coordinate
        annotation.title = "Volcan de Izalco"
        annotation.subtitle="Faro del pacifico"
        
        placeList.append(annotation);
        
        annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocation(latitude: 13.8554813, longitude: -89.6457351).coordinate
        annotation.title = "Volcan de Santa Ana"
        annotation.subtitle="Ilamatepec"
        
        placeList.append(annotation);
        annotation = MKPointAnnotation()
        
        annotation.coordinate = CLLocation(latitude: 13.7371443, longitude: -89.290824).coordinate
        annotation.title = "Volcan de San Salvador"
        annotation.subtitle="Visita el Boqueron"
        
        placeList.append(annotation);
    }
    
    func addPoints() {
        var tmpPoint = CLLocation(latitude: 14.093657, longitude: -89.636763)
        
        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 13.832446, longitude: -89.922408)

        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 13.560261, longitude: -89.219283)
        
        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 13.346564, longitude: -88.252486)
        
        
        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 13.314493, longitude: -87.928389)
        
        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 13.581620, longitude: -87.873458)
        
        polygonList.append(tmpPoint.coordinate)
        
        
        tmpPoint = CLLocation(latitude: 13.752424, longitude: -88.554610)
        
        polygonList.append(tmpPoint.coordinate)
        
        
        tmpPoint = CLLocation(latitude: 13.891111, longitude: -89.032515)
        
        polygonList.append(tmpPoint.coordinate)
        
        tmpPoint = CLLocation(latitude: 14.093657, longitude: -89.636763)
        

    }
    
}
