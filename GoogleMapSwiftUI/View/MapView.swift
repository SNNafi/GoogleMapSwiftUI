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

/// The root view of the application displaying a map that the user can interact with and a
/// button where the user
struct MapView: View {
    
    /// State for markers displayed on the map for each place in `places`
    @State var markers: [GMSMarker] = places.map {
        let marker = GMSMarker(position: $0.coordinate)
        marker.title = nil
        marker.userData = $0
        marker.iconView = UIHostingController(rootView: CustomMarkerView(place: $0)).view
        marker.iconView?.frame = CGRect(x: 0, y: 0, width: 300 , height: 120)
        marker.iconView?.backgroundColor = UIColor.clear
        return marker
    }
    
    @State var zoomInCenter: Bool = false
    @State var expandList: Bool = false
    @State var selectedMarker: GMSMarker?
    @State var yDragTranslation: CGFloat = 0
    @State var currentLocation: CLLocation?
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                // Map - TODO add the map here
                let diameter = zoomInCenter ? geometry.size.width : (geometry.size.height * 2)
                
                MapViewControllerBridge(markers: $markers, selectedMarker: $selectedMarker , onAnimationEnded: {
                    self.zoomInCenter = true
                }, mapViewWillMove: { (isGesture) in
                    guard isGesture else { return }
                    self.zoomInCenter = false
                }, currentLocation: $currentLocation)
                .clipShape(
                    Circle()
                        .size(
                            width: diameter,
                            height: diameter
                        )
                        .offset(
                            CGPoint(
                                x: (geometry.size.width - diameter) / 2,
                                y: (geometry.size.height - diameter) / 2
                            )
                        )
                )
                .animation(.easeIn)
                .background(Color(red: 254.0/255.0, green: 1, blue: 220.0/255.0))
                
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

