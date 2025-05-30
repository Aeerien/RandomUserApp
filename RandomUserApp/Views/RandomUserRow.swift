
import SwiftUI
import CoreLocation

struct RandomUserRow: View {
    let user: User
    let referenceLocation: CLLocation
    let referenceUserName: String?
    let onSelect: () -> Void
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: user.picture.medium)) { phase in
                switch phase {
                case .empty:
                    ProgressView().frame(width: 70, height: 70)
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "person.crop.circle.badge.exclamationmark")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .aspectRatio(contentMode: .fit)
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading,spacing: 4) {
                Text("\(user.name.title) \(user.name.first) \(user.name.last)")
                    .font(.headline)
                let distance = user.distance(to: referenceLocation)
                let distanceNameString = referenceUserName ?? "me"
                Text("Distance to \(distanceNameString) is \(String(format: "%.2f", distance)) km")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
        .contentShape(Rectangle())
        .frame(height: 100)
        .onTapGesture {
            onSelect()
        }
    }
}

#Preview {
    let someUser = User(name: Name(title: "Miss", first: "Liza", last: "black"), picture: Picture(large: "", medium: "https://via.placeholder.com/70", thumbnail: ""), location: Location(coordinates: Coordinates(latitude: "37.7749", longitude: "-122.4194")), login: Login(uuid: "1234"))
    
    RandomUserRow(user: someUser, referenceLocation: CLLocation(latitude: 37.7749, longitude: -122.4194), referenceUserName: "Liza Black", onSelect: {})
}
