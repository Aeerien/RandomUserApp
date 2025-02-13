//  RandomUserViewModel.swift
//  RandomUserApp
//  Created by Irina Arkhireeva on 13.02.2025.

import Foundation
import CoreLocation

@MainActor
class RandomUserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    
    private var movementTask: Task<Void, Never>?
    
    func getRandomUsers() async {
        do {
            let gotRandomUsers = try await APIManager.getUsers()
            self.users = gotRandomUsers
            startRandomMovement()
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    ///Starting a task that updates the user's coordinates every 3 seconds.
    private func startRandomMovement() {
        movementTask?.cancel()
        
        movementTask = Task {
            while !Task.isCancelled {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                updateUserPositions()
            }
        }
    }
    
    ///Updating users coordinates with added random offset.
    func updateUserPositions() {
        users = users.map { user in
            var updatedUser = user
            let currentLatitude = Double(user.location.coordinates.latitude) ?? 0.0
            let currentLongitude = Double(user.location.coordinates.longitude) ?? 0.0
            let latitudeOffset = Double.random(in: -0.01...0.01)
            let longitudeOffset = Double.random(in: -0.01...0.01)
            let newLatitude = currentLatitude + latitudeOffset
            let newLongitude = currentLongitude + longitudeOffset
            
            updatedUser.location.coordinates.latitude = String(newLatitude)
            updatedUser.location.coordinates.longitude = String(newLongitude)
            return updatedUser
        }
    }
    
    deinit {
        movementTask?.cancel()
    }
}
