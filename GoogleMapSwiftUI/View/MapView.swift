// Copyright 2020 Google LLC
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



import SwiftUI
import GoogleMaps
import GoogleMapsUtils
import Kingfisher
import Defaults

struct MapView: View {
    
    /// State for markers displayed on the map for each place in `places`
    @State var markers: [GMSMarker] = places.map {
        let marker = GMSMarker(position: $0.coordinate)
        marker.title = nil
        marker.userData = $0
        marker.tracksViewChanges = false
        marker.iconView = UIHostingController(rootView: CustomMarkerView(place: $0)).view
        marker.iconView?.frame = CGRect(x: 0, y: 0, width: 300 , height: 120)
        marker.iconView?.backgroundColor = UIColor.clear
        return marker
    }
    
    @State var zoomInCenter: Bool = false
    @State var expandList: Bool = false
    @State var selectedMarker: GMSMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: Defaults[.currentLocation][0], longitude: Defaults[.currentLocation][1]))
    @State var isSelectedMarker: Bool = false
    @State var yDragTranslation: CGFloat = 0
    @State var currentLocation: CLLocation?
    @State var clusterShow: Bool = false
    @State var clusterMarkers = [GMSMarker]()
    
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                VStack {
                    GoogleMapView(markers: $markers , currentLocation: $currentLocation, didTap: { marker in
                        if marker.userData is GMUCluster {
                            print(#function)
                            clusterMarkers = ((marker.userData as! GMUCluster).items as! [GMSMarker])
                            clusterShow = true
                            ((marker.userData as! GMUCluster).items as! [GMSMarker]).forEach {
                                print(($0.userData as! Place).name)
                            }
                            return true
                        }
                        selectedMarker = marker
                        isSelectedMarker = true
                        print("(_:didTap:) -> \((marker.userData as! Place).name)")
                        return true
                    })
                    .onAppear {
                        
                    }
                    
                    // Tap on marker
                    NavigationLink(
                        destination: ClusterItemDetailView(marker: selectedMarker),
                        isActive: $isSelectedMarker,
                        label: {  EmptyView() })
                    
                    // Tap on cluster
                    NavigationLink(
                        destination:   ClusterItemListView(size: geometry.size, markers: $clusterMarkers),
                        isActive: $clusterShow,
                        label: {  EmptyView() })
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

