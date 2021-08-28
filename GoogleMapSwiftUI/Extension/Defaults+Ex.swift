//
//  Defaults+Ex.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 28/8/21.
//

import Defaults
import MapKit

extension Defaults.Keys {
    static let currentLocation = Key<[Double]>("currentLocation", default: [])
}
