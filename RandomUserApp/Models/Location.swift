//  LocationModel.swift
//  RandomUserApp
//  Created by Irina Arkhireeva on 13.02.2025.

import Foundation

struct Location: Decodable {
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}
