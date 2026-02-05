# LinkHood 🔥

### *Connecting Neighbors. Building Communities. Fostering Trust.*

**LinkHood** is a hyperlocal community support platform that brings neighbors within walking distance together for borrowing/lending items, skill swapping, and real-time mutual aid. Built on the principles of positivity, trust, and neighborhood solidarity.

---

## 🏷️ Tech Tags

![Node.js](https://img.shields.io/badge/Node.js-43853D?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/Express.js-404D59?style=for-the-badge&logo=express&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![PostGIS](https://img.shields.io/badge/PostGIS-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Prisma](https://img.shields.io/badge/Prisma-3982CE?style=for-the-badge&logo=Prisma&logoColor=white)
![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101)
![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![REST API](https://img.shields.io/badge/REST-02569B?style=for-the-badge&logo=rest&logoColor=white)
![WebSocket](https://img.shields.io/badge/WebSocket-010101?style=for-the-badge&logo=socket.io&logoColor=white)
![Geolocation](https://img.shields.io/badge/Geolocation-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
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

- **Backend Framework:** Node.js with Express.js
- **Database:** PostgreSQL with PostGIS extension
- **ORM:** Prisma ORM with TypedSQL
- **Real-time Communication:** Socket.io
- **Mobile Application:** Flutter (iOS & Android)
- **Geospatial Processing:** PostGIS for location-based queries
- **Authentication:** JWT-based authentication system

---

## 📁 Project Structure

```
linkhood/
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   │   ├── itemController.js
│   │   │   ├── userController.js
│   │   │   └── alertController.js
│   │   ├── routes/
│   │   │   ├── items.js
│   │   │   ├── users.js
│   │   │   └── alerts.js
│   │   ├── middleware/
│   │   │   ├── auth.js
│   │   │   └── validation.js
│   │   ├── services/
│   │   │   ├── geospatial.js
│   │   │   ├── karma.js
│   │   │   └── socket.js
│   │   ├── prisma/
│   │   │   ├── schema.prisma
│   │   │   └── migrations/
│   │   └── server.js
│   ├── package.json
│   └── .env.example
├── mobile/
│   ├── lib/
│   │   ├── screens/
│   │   │   ├── home_screen.dart
│   │   │   ├── map_screen.dart
│   │   │   └── profile_screen.dart
│   │   ├── widgets/
│   │   │   ├── item_card.dart
│   │   │   └── alert_banner.dart
│   │   ├── services/
│   │   │   ├── api_service.dart
│   │   │   └── socket_service.dart
│   │   └── main.dart
│   ├── pubspec.yaml
│   └── android/
│       └── ios/
├── docs/
│   ├── API.md
│   └── DEPLOYMENT.md
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
- Node.js (v18 or higher)
- PostgreSQL (v14 or higher) with PostGIS extension
- Flutter SDK (v3.0 or higher)
- npm or yarn package manager

### Backend Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/linkhood.git
cd linkhood/backend
```

2. **Install dependencies**
```bash
npm install
```

3. **Configure environment variables**
```bash
cp .env.example .env
# Edit .env with your database credentials and API keys
```

4. **Enable PostGIS extension**
```sql
CREATE EXTENSION IF NOT EXISTS postgis;
```

5. **Run database migrations**
```bash
npx prisma migrate dev
```

6. **Seed initial data (optional)**
```bash
npm run seed
```

7. **Start the development server**
```bash
npm run dev
```

The backend server will start on `http://localhost:3000`

### Mobile App Setup

1. **Navigate to mobile directory**
```bash
cd ../mobile
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

---

## 📡 API Documentation

### Core Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| **GET** | `/api/items/nearby` | Fetch items within user's geofenced area (500m-1km radius) | ✅ Yes |
| **POST** | `/api/items/post` | Create a new lending item with location, category, and availability | ✅ Yes |
| **POST** | `/api/users/signup` | Register new user with location permissions and profile details | ❌ No |
| **GET** | `/api/users/profile/:id` | Retrieve user profile with karma score and lending history | ✅ Yes |
| **POST** | `/api/alerts/create` | Broadcast real-time mutual aid alert to nearby neighbors | ✅ Yes |
| **GET** | `/api/alerts/nearby` | Fetch active alerts within walking distance | ✅ Yes |
| **PUT** | `/api/items/:id/status` | Update item availability status (available, borrowed, returned) | ✅ Yes |
| **POST** | `/api/karma/endorse` | Give positive karma to another community member | ✅ Yes |

### Example Request: Get Nearby Items

```bash
GET /api/items/nearby?lat=37.7749&lng=-122.4194&radius=800
Authorization: Bearer <your_jwt_token>
```

**Response:**
```json
{
  "success": true,
  "items": [
    {
      "id": "item_123",
      "name": "Power Drill",
      "category": "Tools",
      "owner": {
        "id": "user_456",
        "name": "John Doe",
        "karma": 95
      },
      "distance": 340,
      "available": true,
      "imageUrl": "https://..."
    }
  ]
}
```

---

## 🌍 Geospatial Implementation

LinkHood leverages **PostGIS**, a spatial database extension for PostgreSQL, to implement precise location-based features:

### Walking Distance Logic

Our geofencing system uses PostGIS's `ST_DWithin` function to calculate spherical distance in meters:

```sql
SELECT * FROM items 
WHERE ST_DWithin(
  location::geography,
  ST_SetSRID(ST_MakePoint(lng, lat), 4326)::geography,
  1000  -- 1km radius
);
```

**Key Benefits:**
- **Accuracy:** Geography type accounts for Earth's curvature
- **Performance:** Spatial indexes (GIST) enable sub-millisecond queries
- **Flexibility:** Dynamic radius adjustment (500m-1km based on density)

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
