

//
//  MapViewController.swift
//  GoogleMapSwiftUI
//
//  Created by Shariar Nasim Nafi on 4/7/21.
//


import GoogleMaps
import GoogleMapsUtils
import SwiftUI
import UIKit

class MapViewController: UIViewController {
    
    let map =  GoogleMaps.GMSMapView(frame: .zero)
    var clusterManager: GMUClusterManager!
    var isAnimating: Bool = false
    let camera = GMSCameraPosition.camera(withLatitude: 24.78504812901799, longitude:  90.39632986635996, zoom: 12.5)
    
    override func viewDidLoad() {
        
        // Set up the cluster manager with the supplied icon generator and
        // renderer.
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: map,
                                                 clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: map, algorithm: algorithm,
                                           renderer: renderer)
        map.camera = camera
        map.settings.myLocationButton = true
        map.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        map.isMyLocationEnabled = true
        
    }
    
    override func loadView() {
        super.loadView()
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "CustomMapStyle", withExtension: "json") {
                map.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                print("Style applied")
            } else {
                print(".json file not found")
            }
        } catch {
            print("One or more of the map styles failed to load. \(error)")
        }
        self.view = map
    }
}
