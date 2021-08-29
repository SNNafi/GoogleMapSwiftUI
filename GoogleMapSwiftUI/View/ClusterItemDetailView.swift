//
//  ClusterItemView.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 28/8/21.
//

import SwiftUI
import Kingfisher
import GoogleMaps
import Defaults

struct ClusterItemDetailView: View {
    var marker = GMSMarker(position: CLLocationCoordinate2D(latitude: Defaults[.currentLocation][0], longitude: Defaults[.currentLocation][1]))
    var place: Place {
        marker.userData as! Place
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: place.imageUrl)!)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2))
                .padding(.top, 10)
            Text(place.name)
                .font(.headline)
            Text(place.shortInfo)
                .multilineTextAlignment(.center)
                .font(.caption)
                .padding(.all, 2)
            
        }
        .navigationBarTitle("\(place.name)", displayMode: .large)
        .foregroundColor(.white)
        .background(Color.black)
        .padding(5)
        .border(Color.blue, width: 2)
        .shadow(radius: 10)
    }
}

struct ClusterItemView_Previews: PreviewProvider {
    static var previews: some View {
        ClusterItemDetailView()
    }
}
