
//
//  MapViewControllerBridge.swift
//  GoogleMapSwiftUI
//
//  Created by Shariar Nasim Nafi on 4/7/21.
//

import SwiftUI
import GoogleMaps
import GoogleMapsUtils
import Defaults

struct GoogleMapView: UIViewControllerRepresentable {
    
    @Binding var markers: [GMSMarker] // showing markers list
    @Binding var selectedMarker: GMSMarker? // for selecting
    @Binding var currentLocation: CLLocation?
    var onAnimationEnded: () -> ()
    var mapViewWillMove: (Bool) -> ()
    var didTap: (GMSMarker) -> (Bool)
    var locationManager = CLLocationManager()
    let mapViewController = MapViewController()
    
    func makeUIViewController(context: Context) -> MapViewController {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = context.coordinator
        mapViewController.map.delegate = context.coordinator      
        return mapViewController
    }
    
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
        uiViewController.clusterManager.setMapDelegate(context.coordinator)
        uiViewController.clusterManager.clearItems()
        markers.forEach { $0.map = uiViewController.map }
        uiViewController.clusterManager.add(markers)
        uiViewController.clusterManager.cluster()
        selectedMarker?.map = uiViewController.map
        animateToSelectedMarker(viewController: uiViewController)
    }
    
    private func animateToSelectedMarker(viewController: MapViewController) {
        guard let selectedMarker = selectedMarker else {
            return
        }
        
        let map = viewController.map
        if map.selectedMarker != selectedMarker {
            map.selectedMarker = selectedMarker
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                map.animate(toZoom: kGMSMinZoomLevel)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    map.animate(with: GMSCameraUpdate.setTarget(selectedMarker.position))
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        map.animate(toZoom: 12)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                            // Invoke onAnimationEnded() once the animation sequence completes
                            onAnimationEnded()
                        })
                    })
                }
            }
        }
    }
    
    final class MapViewCoordinator: NSObject, GMSMapViewDelegate, CLLocationManagerDelegate {
        var googleMapView: GoogleMapView
        var preciseLocationZoomLevel: Float = 15.0
        var approximateLocationZoomLevel: Float = 10.0
        
        init(_ mapViewControllerBridge: GoogleMapView) {
            self.googleMapView = mapViewControllerBridge
        }
        
        
        // MARK: GMSMapViewDelegate
        
        func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
            
        }
        
        func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
            self.googleMapView.mapViewWillMove(gesture)
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            
            // center the map on tapped marker
            if !(marker.userData is GMUCluster) {
                mapView.animate(toLocation: marker.position)
            } else {
                mapView.camera = GMSCameraPosition.camera(withLatitude: Defaults[.currentLocation][0], longitude:  Defaults[.currentLocation][1], zoom: 12.5)
            }
            return self.googleMapView.didTap(marker)
            
            //            if marker.userData is GMUCluster {
            //                print(#function)
            //                ((marker.userData as! GMUCluster).items as! [GMSMarker]).forEach { _ in
            //                    // print(($0.userData as! Place).name)
            //                }
            //
            //                return true
            //            }
            //            print("\(#function) -> \((marker.userData as! Place).name)")
            //            return true
            
        }
        
        // MARK: CLLocationManagerDelegate
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location: CLLocation = locations.last!
            Defaults[.currentLocation] = [location.coordinate.latitude, location.coordinate.longitude]
            print("Location: \(location)")
            var zoomLevel = approximateLocationZoomLevel
            if #available(iOS 14.0, *) {
                zoomLevel = manager.accuracyAuthorization == .fullAccuracy ? preciseLocationZoomLevel : approximateLocationZoomLevel
            }
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: zoomLevel)
            let mapView = self.googleMapView.mapViewController.map
            if mapView.isHidden {
                mapView.isHidden = false
                mapView.camera = camera
            } else {
                mapView.animate(to: camera)
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
            if #available(iOS 14.0, *) {
                let accuracy = manager.accuracyAuthorization
                switch accuracy {
                case .fullAccuracy:
                    print("Location accuracy is precise.")
                case .reducedAccuracy:
                    print("Location accuracy is not precise.")
                @unknown default:
                    fatalError()
                }
            }
            
            switch status {
            case .restricted:
                print("Location access was restricted.")
            case .denied:
                print("User denied access to location.")
            case .notDetermined:
                print("Location status not determined.")
            case .authorizedAlways: fallthrough
            case .authorizedWhenInUse:
                print("Location status is OK.")
                manager.startUpdatingLocation()
            @unknown default:
                fatalError()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            manager.stopUpdatingLocation()
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator(self)
    }
}

