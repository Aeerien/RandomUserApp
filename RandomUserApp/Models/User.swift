
import Foundation
import CoreLocation

struct APIResponse: Decodable {
    let results: [User]
}

struct User: Identifiable, Decodable {
    var id: String { login.uuid}
    
    let name: Name
    let picture: Picture
    var location: Location
    let login: Login
    
    func distance(to location: CLLocation) -> Double {
        let latitude = Double(self.location.coordinates.latitude) ?? 0
        let longitude = Double(self.location.coordinates.longitude) ?? 0
        
        let userLocation = CLLocation(latitude: latitude, longitude: longitude)
        return userLocation.distance(from: location) / 1000
    }
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Login: Decodable {
    let uuid: String
}
