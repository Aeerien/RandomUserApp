//  RandomUserAppApp.swift
//  RandomUserApp
//  Created by Irina Arkhireeva on 13.02.2025.

import SwiftUI

@main
struct RandomUserApp: App {
    init() {
        RandomUserApp.setUpNavigationBar()
    }
    
    var body: some Scene {
        WindowGroup {
            RandomUserView()
        }
    }
    
    private static func setUpNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.7)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = UIColor.white
    }
}
