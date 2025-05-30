
import SwiftUI
import CoreLocation

struct PinnedUserCell: View {
    let user: User
    let referenceLocation: CLLocation
    let referenceUserName: String?
    let onDeselect: () -> Void
    
    var body: some View {
        RandomUserRow(
            user: user,
            referenceLocation: referenceLocation,
            referenceUserName: referenceUserName,
            onSelect: onDeselect
        )
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 4)
        .aspectRatio(contentMode: .fit)
    }
}

#Preview {
    let someUser = User(name: Name(title: "Miss", first: "Liza", last: "Black"), picture: Picture(large: "", medium: "https://via.placeholder.com/70", thumbnail: ""), location: Location(coordinates: Coordinates(latitude: "37.7749", longitude: "-122.4194")), login: Login(uuid: "1234"))
    
    PinnedUserCell(user: someUser, referenceLocation: CLLocation(latitude: 37.7749, longitude: -122.4194), referenceUserName: "Liza Black", onDeselect: {}
    )
}
