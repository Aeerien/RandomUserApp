
import Foundation

struct Location: Decodable {
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}
