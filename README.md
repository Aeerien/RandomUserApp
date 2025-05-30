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

```markdown
![Location notification](/Users/irinaarkhireeva/Downloads/IMG_3265.PNG)
![Main Screen](/Users/irinaarkhireeva/Downloads/IMG_3266.PNG)
![User Selection](/Users/irinaarkhireeva/Downloads/IMG_3267.PNG)
``` 
