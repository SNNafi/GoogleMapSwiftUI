//
//  CustomMarkerView.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 27/8/21.
//

import SwiftUI
import Kingfisher

struct CustomMarkerView: View {
    
    var place = places[5]
    
    var body: some View {
        HStack(alignment: .center) {
            KFImage(URL(string: place.imageUrl)!)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2))
            Text(place.name)
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
                .frame(alignment: .topLeading)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.black))
            
        } .background(Color.clear)
        .shadow(radius: 10)
    }
}

struct CustomMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMarkerView()
    }
}
