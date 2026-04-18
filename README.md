# LinkHood 🔥

### *Connecting Neighbors. Building Communities. Fostering Trust.*

**LinkHood** is a hyperlocal community support platform that brings neighbors within walking distance together for borrowing/lending items, skill swapping, and real-time mutual aid. Built on the principles of positivity, trust, and neighborhood solidarity.

---

## 🏷️ Tech Tags

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3FCF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-0EA5E9?style=for-the-badge&logo=flutter&logoColor=white)
![Go%20Router](https://img.shields.io/badge/Go_Router-1F2937?style=for-the-badge&logo=flutter&logoColor=white)
![Hive](https://img.shields.io/badge/Hive-FFB300?style=for-the-badge&logo=databricks&logoColor=white)
![Sqflite](https://img.shields.io/badge/Sqflite-0F766E?style=for-the-badge&logo=sqlite&logoColor=white)
![Google%20Sign-In](https://img.shields.io/badge/Google_Sign--In-4285F4?style=for-the-badge&logo=google&logoColor=white)
![Geolocation](https://img.shields.io/badge/Geolocation-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)

---

## 🌟 Core Concept

LinkHood creates micro-communities based on **geographic proximity** (500m-1km walking distance), enabling neighbors to:

- **Borrow & Lend** everyday items without the need to purchase
- **Swap Skills** and share knowledge within the community
- **Respond to Real-time Alerts** for mutual aid and neighborhood support
- **Build Trust** through a karma-based reputation system

Our platform operates on a **positivity-only** philosophy, fostering genuine connections and community resilience.

---

## 🛠️ Tech Stack

- **Mobile Application:** Flutter (iOS, Android, Web, Windows)
- **Language:** Dart (SDK `^3.10.7`)
- **State Management:** Riverpod
- **Navigation:** Go Router
- **Backend Integration:** Supabase
- **Local Storage:** Hive, Sqflite, Shared Preferences, Secure Storage
- **Location Services:** Geolocator + Geocoding

---

## 📁 Project Structure

```
linkhood/
├── android/
├── ios/
├── web/
├── windows/
├── assets/
│   ├── icons/
│   └── images/
├── docs/
│   ├── api-contracts.md
│   ├── Architecture.md
│   ├── database-schema.md
│   ├── PRD.md
│   ├── system-architecture.md
│   └── testing-strategy.md
├── lib/
│   ├── core/
│   │   ├── constants/
│   │   ├── errors/
│   │   ├── theme/
│   │   ├── utils/
│   │   └── widgets/
│   ├── features/
│   │   ├── auth/
│   │   ├── home/
│   │   ├── listings/
│   │   ├── notifications/
│   │   ├── profile/
│   │   ├── ratings/
│   │   ├── rentals/
│   │   ├── reports/
│   │   └── requests/
│   ├── routes/
│   │   └── app_router.dart
│   ├── services/
│   │   ├── location_service.dart
│   │   ├── notification_service.dart
│   │   └── supabase_service.dart
│   └── main.dart
├── test/
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
└── README.md
```

---

## ✨ Key Features

### 🗺️ **Geofencing & Hyperlocal Discovery**
- Automatically connects users within 500m-1km walking distance
- Real-time location-based item and service discovery
- Privacy-focused location sharing (neighborhood-level only)

### 📚 **Lending Library**
- Post items available for borrowing (tools, books, equipment)
- Browse nearby available items with availability status
- Schedule pickups and returns with built-in messaging
- Track lending history and item condition reports

### 🚨 **Real-time Mutual Aid Alerts**
- Emergency neighborhood notifications (lost pets, safety alerts)
- Community assistance requests (helping elderly, childcare)
- Socket.io powered instant push notifications
- Geographic filtering ensures relevance

### ⭐ **Karma & Trust System**
- Reputation scoring based on successful transactions
- Community endorsements and verified skills
- Trust badges for reliable community members
- Positive-only feedback system (no negative reviews)

---

## 🚀 Installation Guide

### Prerequisites
- Flutter SDK (compatible with Dart `^3.10.7`)
- Android Studio / VS Code with Flutter tools
- Supabase project (URL + anon key)

### App Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/linkhood.git
cd linkhood
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Create `.env` in project root**
```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

4. **Run the app**
```bash
flutter run
```

5. **Run checks (recommended)**
```bash
flutter analyze
flutter test
```

---

## 📡 API Documentation

Current API contracts and backend interaction references are maintained in:

- `docs/api-contracts.md`
- `docs/system-architecture.md`
- `docs/database-schema.md`

This repository currently focuses on the Flutter client implementation and integration with Supabase.

---

## 🌍 Geospatial Implementation

LinkHood uses device location services and radius-based neighborhood discovery flows in the mobile client.

### Current Approach

- Geolocation via `geolocator`
- Reverse geocoding via `geocoding`
- Hyperlocal filtering logic documented in `docs/scoring-engine-spec.md` and `docs/api-contracts.md`

**Key Benefits:**
- **Relevance:** Neighborhood-first discovery by proximity
- **Privacy:** Focused on local context rather than global exposure
- **Flexibility:** Radius and scoring behavior can be tuned by product rules

### Location Privacy

- User coordinates stored with 100m precision blur
- Only neighborhood-level visibility in profiles
- Exact location shared only during active transactions

---

## 🤝 Contributing

We welcome contributions from the community! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please read our [Contributing Guidelines](CONTRIBUTING.md) for code standards and community expectations.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### 🌱 *Together, we build stronger neighborhoods.*
