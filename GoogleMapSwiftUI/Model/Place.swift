//
//  Place.swift
//  GoogleMapSwiftUI
//
//  Created by Shahriar Nasim Nafi on 27/8/21.
//

import CoreLocation

struct Place {
    var name: String
    var imageUrl: String
    var shortInfo: String
    var coordinate: CLLocationCoordinate2D
}

let places = [
    Place(name: "Ahsan Manzil Museum", imageUrl: "https://lh5.googleusercontent.com/proxy/1n60XlWJ2aDHGnskJ6UZcJ_RNEQZp9NcbyLu7jt32ywmiRDqr5rH2eT88SvSIWs_1dQnEZIEDKPIh-3-6ql8ub8lB7T3AzvSR-c_wOFG3__k76JcVbTGn9UBw1iP8xIMfHSMw2YhEER3XNcU_dVeaDBhy3Lw_EA=w408-h272-k-no", shortInfo: "1800s palace of the Nawabs of Dhaka featuring an iconic pink facade, a dome & period furnishings.", coordinate: CLLocationCoordinate2D(latitude: 23.7085915, longitude: 90.4038187)),
    Place(name: "Lalbagh Fort", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipMH2-1wNxVy9LxTtxWY1w6ID56LqbNGRUu7H1fm=w408-h272-k-no", shortInfo: "1600s fort complex with 3 buildings, including a mosque, containing paintings, antiques & weapons.", coordinate: CLLocationCoordinate2D(latitude: 23.7210473, longitude: 90.380906)),
    Place(name: "Patenga Sea Beach", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipOFFsYrR24SafFVoM5YXf_vDMEq6U93S_GK1vrn=w408-h262-k-no", shortInfo: "Bustling beach on the Bay of Bengal featuring boating, street-food vendors & more..", coordinate: CLLocationCoordinate2D(latitude: 22.2359795, longitude: 91.7868103)),
    Place(name: "Ratargul Swamp Forest", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipNafnRsC61yBrKemwIQNGe1dhN9lFKeCov2bhrx=w408-h255-k-no", shortInfo: "Unique freshwater swamp forest for tranquil boat rides amid submerged trees during monsoon season.", coordinate: CLLocationCoordinate2D(latitude: 25.0141799, longitude: 91.9165124)),
    Place(name: "Boga Lake", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipPy1F-7lWoI4Pn7W2uCh1Ws2f4u6HP8t8Bc7KXB=w408-h271-k-no", shortInfo: "Natural sweet & deep water lake surrounded by mountain peaks with thick bamboo forests.", coordinate: CLLocationCoordinate2D(latitude: 21.9803392, longitude: 92.4675491)),
    Place(name: "Tanguar Haor", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipPO34CSrAo7wnNw4jkTcgdr0zAolP4VOgVALiv-=w427-h240-k-no", shortInfo: "Unique wetland ecosystem of national importance and has come into international focus", coordinate: CLLocationCoordinate2D(latitude: 25.1405767, longitude: 91.0880596)),
    Place(name: "Nafa-khum Waterfalls", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipPO34CSrAo7wnNw4jkTcgdr0zAolP4VOgVALiv-=w427-h240-k-no", shortInfo: "Secluded waterfall cascading down 25 to 30 ft., reachable by a scenic trek or riverboat ride.", coordinate: CLLocationCoordinate2D(latitude: 21.7203942, longitude: 92.5315654)),
    Place(name: "Foy's Lake", imageUrl: "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcQxPizEqEfI2uXe-a7wTEECEPvItyqct4ha-3XeoxKjcY1Q_mhM6IiC3VpMDu3dmS_oz_67mJ_xcDPu0Q", shortInfo: "A man-made lake in Chittagong, Bangladesh.", coordinate: CLLocationCoordinate2D(latitude: 22.3734854, longitude: 91.7876977)),
    Place(name: "Amiakhum WaterFall", imageUrl: "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcQGQErf6bNpVHJL3Z7CUvquh4Ckk4JkEykPo1LwTZj6bXvSAP7Ogn0fjwxSKcRwgc963ADwuBq_2ji2Yw", shortInfo: "A magnificent waterfall located in Thanchi upazila of Bandarban district.", coordinate: CLLocationCoordinate2D(latitude: 21.7766275, longitude: 92.5466823)),
    Place(name: "Bandarban - Thanchi Road", imageUrl: "https://encrypted-tbn2.gstatic.com/licensed-image?q=tbn:ANd9GcRp2zYC65Ozp8y7zMu0vUv7vAwTyJwu0P-mEBUnTqALwBc-_MoR-75vyyGxHITmwU2vELKlP38jo4xFiw", shortInfo: "About 3500 feet high and situated at Thanci PS (Police Station. About 46 km south of Bandarban on the Bandarban-Chimbuk-Thanchi road.", coordinate: CLLocationCoordinate2D(latitude: 21.8826909, longitude: 92.3028878)),
    Place(name: "Alu Tila Guha", imageUrl: "https://lh5.googleusercontent.com/p/AF1QipM8LwwdfblsOUzQazd9iCFOjCvkpLsBNSOk_417=w408-h271-k-no", shortInfo: "Dark, natural tunnel over 100m long on a thickly forested mountain, with a slippery walking trail.", coordinate: CLLocationCoordinate2D(latitude: 23.088868, longitude: 91.9542318))
    
]





