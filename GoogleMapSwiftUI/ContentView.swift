//
//  ContentView.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 4/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            MapView()
                .navigationBarTitle("Google Maps SwiftUI", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
