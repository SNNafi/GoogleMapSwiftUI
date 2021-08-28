//
//  ClusterItemListView.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 28/8/21.
//

import SwiftUI
import Kingfisher
import GoogleMaps
import GoogleMapsUtils

struct ClusterItemListView: View {
    var size: CGSize = CGSize(width: 400, height: 700)
    @Binding var markers: [GMSMarker]
    var body: some View {
        List {
            ForEach(0..<markers.count) { index in
                HStack(alignment: .center) {
                    let place = (markers[index].userData as! Place)
                    KFImage(URL(string: place.imageUrl)!)
                        .resizable()
                        .frame(width: 70, height: 70, alignment: .center)
                        .clipShape(Circle())
                    Text(place.name)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    Spacer()
                    
                }
                .padding()
                .background(Color.black)
            }
        }
        .background(Color(white: 0.9))
        .cornerRadius(5)
        .shadow(radius: 20)
    }
}

struct ClusterItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ClusterItemListView(markers: .constant([]))
    }
}
