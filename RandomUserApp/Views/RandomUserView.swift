//  RandomUserView.swift
//  RandomUserApp
//  Created by Irina Arkhireeva on 13.02.2025.

import SwiftUI
import CoreLocation

struct RandomUserView: View {
    @StateObject private var randomUserViewModel = RandomUserViewModel()
    @StateObject private var locationManager = LocationManager()
    @State private var pinnedUserId: String? = nil
    
    private var referenceLocation: CLLocation {
        if let pannedId = pinnedUserId,
           let pannedUser = randomUserViewModel.users.first(where: { $0.id == pannedId }) {
            let latitude = Double(pannedUser.location.coordinates.latitude) ?? 0.0
            let longitude = Double(pannedUser.location.coordinates.longitude) ?? 0.0
            return CLLocation(latitude: latitude, longitude: longitude)
        }
        return locationManager.currentLocation ?? CLLocation(latitude: 0, longitude: 0)
    }
    
    private var referenceUserName: String? {
        if let pannedId = pinnedUserId,
           let pannedUser = randomUserViewModel.users.first(where: { $0.id == pannedId }) {
            return "\(pannedUser.name.first) \(pannedUser.name.last)"
        }
        return nil
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                if let pannedId = pinnedUserId,
                   let pannedUser = randomUserViewModel.users.first(where: { $0.id == pannedId }) {
                    RandomUserRow(
                        user: pannedUser,
                        referenceLocation: referenceLocation,
                        referenceUserName: referenceUserName,
                        onSelect: { pinnedUserId = nil }
                    )
                    .padding(.horizontal, 16)
                }
                
                List {
                    ForEach(randomUserViewModel.users.filter { $0.id != pinnedUserId }) { user in
                        RandomUserRow(
                            user: user,
                            referenceLocation: referenceLocation,
                            referenceUserName: referenceUserName,
                            onSelect: { pinnedUserId = user.id }
                        )
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.white)
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            .navigationBarTitle(
                locationManager.city.isEmpty
                ? "My location is not available"
                : "\(String(locationManager.city))",
                displayMode: .inline
            )
        }
        
        .task {
            await randomUserViewModel.getRandomUsers()
        }
        
        .alert(isPresented: .constant(randomUserViewModel.errorMessage != nil)) {
            Alert(title: Text("Error"),
                  message: Text(randomUserViewModel.errorMessage ?? "Unknown error"),
                  dismissButton: .default(Text("OK"), action: {
                    randomUserViewModel.errorMessage = nil
                })
            )
        }
    }
}

#Preview {
    RandomUserView()
}
