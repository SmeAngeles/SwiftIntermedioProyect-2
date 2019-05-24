//
//  Maps.swift
//  SwiftIntermedioProyect
//
//  Created by Esmeralda Angeles on 5/23/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Maps: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var llblDireccion: UILabel!
    @IBOutlet weak var lblPersona: UILabel!
    @IBOutlet weak var lblAdeudo: UILabel!
    @IBOutlet weak var lblNota: UILabel!
    
    let geocoder = CLGeocoder()
    
    var ruta: CobranzaEmployee?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.map.delegate = self

        setUpDirection()
        setInfo()
    }
    
    func setUpDirection(){
        let direccion =  ruta?.ruta?.direccion
        
        geocoder.geocodeAddressString(direccion!) { (placemarks, error) in
            if error !=  nil{
                print("Error")
            }
            if let place = placemarks{
                
                let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                let coordinate =  CLLocationCoordinate2D(latitude: (place[0].location?.coordinate.latitude)!,
                                                         longitude: (place[0].location?.coordinate.longitude)!)
                let region = MKCoordinateRegion(center: coordinate, span: span )

                let coordinate2 =  CLLocationCoordinate2D(latitude: 19.296715,
                                                         longitude: -99.186001)
                let region2 = MKCoordinateRegion(center: coordinate2, span: span )
     
                let sourcePlacemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
                let destinationPlacemark = MKPlacemark(coordinate: coordinate2, addressDictionary: nil)
                
                let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
                let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
                
                let sourceAnnotation = MKPointAnnotation()
                
                if let location = sourcePlacemark.location {
                    sourceAnnotation.coordinate = location.coordinate
                    sourceAnnotation.title = "Estas Aqui"
                    sourceAnnotation.coordinate = coordinate2
                }
                
                let destinationAnnotation = MKPointAnnotation()
                
                if let location = destinationPlacemark.location {
                    destinationAnnotation.coordinate = location.coordinate
                    destinationAnnotation.title = "Ve a acá"
                    destinationAnnotation.coordinate = coordinate
                }
                
                self.map.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )
                
                let directionRequest = MKDirections.Request()
                directionRequest.source = sourceMapItem
                directionRequest.destination = destinationMapItem
                directionRequest.transportType = .automobile
                
                // Calculate the direction
                let directions = MKDirections(request: directionRequest)
                
                directions.calculate {
                    (response, error) -> Void in
                    
                    guard let response = response else {
                        if let error = error {
                            print("Error: \(error)")
                        }
                        
                        return
                    }
                    
                    let route = response.routes[0]
                    
                    self.map.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
                    
                    let rect = route.polyline.boundingMapRect
                    self.map.setRegion(MKCoordinateRegion(rect), animated: true)
                    
                    //self.map.setRegion(region, animated: true)
                    
                    self.map.addAnnotation(destinationAnnotation)
                    self.map.selectAnnotation(destinationAnnotation, animated: true)
                    self.map.addAnnotation(sourceAnnotation)
                    self.map.selectAnnotation(sourceAnnotation, animated: true)
                }
                
                
                
            }
        }
        
    }
    
    
    func setInfo(){
        llblDireccion.text = ruta?.ruta?.direccion
        lblPersona.text =  ruta?.ruta?.personaAvisitar
        lblAdeudo.text = ruta?.ruta?.adeudo
        lblNota.text = ruta?.ruta?.nota
    }
    

}

extension Maps: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        renderer.lineWidth = 5.0
        return renderer
    }
    
}
