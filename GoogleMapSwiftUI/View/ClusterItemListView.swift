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
    @State private var pushedViewId: Int? = nil
    var body: some View {
        VStack {
            List {
                ForEach(0..<markers.count) { index in
                    Button(action: {
                        pushedViewId = index
                    }, label: {
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
                    })
                    .background(NavigationLink("", destination: ClusterItemDetailView(marker: markers[index]), tag: index, selection: $pushedViewId))
                }
            }
            .listStyle(PlainListStyle())
            // .frame(width: size.width * 0.85, height: size.height * 0.77, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
        .background(Color(white: 0.9))
        .navigationBarTitle("Places", displayMode: .inline)
    }
}

struct ClusterItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ClusterItemListView(markers: .constant([]))
    }
}
