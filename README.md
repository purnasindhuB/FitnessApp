# 🏋️‍♂️ FitnessApp – iOS

![Swift](https://img.shields.io/badge/Swift-5.0-orange)
![Platform](https://img.shields.io/badge/Platform-iOS-blue)
![UIKit](https://img.shields.io/badge/UIKit-%F0%9F%93%B1-lightgrey)
![Lottie](https://img.shields.io/badge/Lottie-Animation-green)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

An elegant, animation-rich iOS Fitness App built with Swift. This app leverages **Lottie animations**, **custom Core Animation (CA Layer)** drawings (like loading arcs), and a **model-driven architecture** to provide a smooth and visually engaging user experience.

---

## ✨ Features

- 🎬 **Lottie Animations**
  - Used across workout completion screens, loading states, and onboarding for rich visual feedback.
  - Smooth integration using `Lottie-ios` framework.
  
- 🌀 **Custom CA Layer Animations**
  - Hand-drawn arcs, circular progress loaders, and animated rings using `CAShapeLayer`, `CABasicAnimation`, and `CADisplayLink`.
  - Lightweight, hardware-accelerated vector animations.

- 📦 **Model-Based Architecture**
  - Clean separation between UI and data.
  - Reusable `Model` structs for workouts, progress, and user data.
  - Easily testable and maintainable codebase.

- 📱 **Swift + UIKit**
  - Built primarily using UIKit.
  - Modular structure for components like animated loaders and workout cards.

---
## 📸 Screenshots

### 🏠 Dashboard View
![Dashboard](https://github.com/purnasindhuB/FitnessApp/blob/main/Screenshot%202025-07-06%20at%202.27.28%20AM.png?raw=true)


## 🛠️ Tech Stack

- **Language**: Swift 5+
- **Animation**: [Lottie](https://github.com/airbnb/lottie-ios), Core Animation (CA Layer)
- **Architecture**: MVC 
- **Tools**: Xcode, Instruments, LLDB

---

## 📂 Project Structure

FitnessApp/
├── Model/                        # Data models for Program & Exercise
│   ├── Program.swift
│   └── Excercise.swift
│
├── View/                         # UI components like custom table cells
│   ├── ProgramTableViewCell.swift
│
├── ViewController/              # Main screen logic
│   ├── DashboardViewController.swift
│   ├── WorkoutViewController.swift
│   └── WorkoutResultController.swift
│
├── Components/                  # Reusable custom views
│   ├── ShadowButton.swift
│   ├── RingView.swift           # CA Layer based arc loader
│   └── BarChartView.swift       # Progress bar chart
│
├── Extensions/
│   └── Extension+UIColor.swift  # Custom color utilities
│
├── Resources/
│   ├── Lottie/                  # Lottie animation JSON files
│   │   ├── trophy.json
│   │   ├── jumpingjack.json
│   │   └── pushups.json
│   └── Font/
│
├── Design/                      # Design constants and theme
│   ├── Colors.xcassets
│   └── Typography.swift
│
├── AppDelegate.swift
├── SceneDelegate.swift
├── Main.storyboard
├── Assets.xcassets
└── LaunchScreen.storyboard

1. Clone the repo:
   ```bash
   git clone https://github.com/yourusername/FitnessApp.git
   cd FitnessApp
2. Open in Xcode
   
     open FitnessApp.xcodeproj
3. Build & Run
   
   Choose your simulator or real device and hit Cmd + R.


---
   👤 Author
Purnasindhu Bachu
📧 purnasindhubachu@gmail.com
🔗 GitHub

