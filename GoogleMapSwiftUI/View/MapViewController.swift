// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  MapViewController.swift
//  GoogleMapsSwiftUI
//
//  Created by Chris Arriola on 2/5/21.
//

import GoogleMaps
import GoogleMapsUtils
import SwiftUI
import UIKit

class MapViewController: UIViewController {
    
    let camera =  GMSCameraPosition.camera(withLatitude: 24.78504812901799, longitude:  90.39632986635996, zoom: 14.5)
    let map =  GMSMapView(frame: .zero)
    //    var clusterManager: GMUClusterManager!
    
    var isAnimating: Bool = false
    
    
    override func viewDidLoad() {
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: map,
                                                 clusterIconGenerator: iconGenerator)
        //        clusterManager = GMUClusterManager(map: map, algorithm: algorithm,
        //                                                  renderer: renderer)
    }
    
    override func loadView() {
        super.loadView()
        map.camera = camera
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
