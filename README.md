# 📱 RandomUserApp

RandomUserApp is a SwiftUI application that demonstrates fetching and displaying random user
profiles using the MVVM architectural pattern. The app emphasizes clean code structure, modular
design, and modern Swift development practices such as Combine and Swift Concurrency.

---

## 🚀 Features

- Fetch random users from an API
- SwiftUI-based UI with responsive design
- MVVM architecture: clear separation of responsibilities
- State management with `@State`, `@Published`, `@ObservedObject`
- Location caching and access using CoreLocation
- Reusable views and components
- A unique feature of this app is the ability to determine the user's current location and display the distance to any selected ("pinned") user from the list. Once a user is pinned, the app calculates and displays the distance from your current location to that user's geographic position

---

## 📁 Project Structure

```
RandomUserApp/
│
├── Managers/              # Networking and Location services
│   ├── APIError.swift
│   ├── APIManager.swift
│   └── LocationManager.swift
│
├── Models/                # Data models
│   ├── User.swift
│   └── Location.swift
│
├── ViewModels/            # View logic and state
│   └── RandomUserViewModel.swift
│
├── Views/                 # SwiftUI views and UI components
│   ├── PinnedUserCell.swift
│   ├── RandomUserRow.swift
│   └── RandomUserView.swift
│
├── Resources/             # App assets and icons
│   └── Assets.xcassets/
│
├── Preview Content/       # Preview content for SwiftUI canvas
│
└── RandomUserApp.swift    # App entry point
```

---

## 🛠️ Technologies

- Swift 5 
- SwiftUI
- Combine
- CoreLocation
- REST API
- MVVM Design Pattern

---

## 📦 Getting Started

1. Clone the repository:

```bash
git clone https://github.com/Aeerien/RandomUserApp.git
```

2. Open the project in Xcode (version 14.0 or later recommended).

3. Build and run on a simulator or device.

---

## 📸 Screenshots

<img src="https://github.com/user-attachments/assets/59d278d5-dc45-4fed-952f-9aeb63c84576" width="150"/>
<img src="https://github.com/user-attachments/assets/33f6c465-8775-44a8-8951-63b4adb2da4e" width="150"/>
<img src="https://github.com/user-attachments/assets/26bb6971-8b51-4df6-a57b-5516c7398b84" width="150"/>

