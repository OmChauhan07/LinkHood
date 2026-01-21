# 🏠 LinkHood Backend

Name: LinkHood API (The Hyperlocal Engine)

Small Description: A high-performance geospatial and real-time API built to power the LinkHood ecosystem. It utilizes PostGIS for precise "walking distance" calculations and Socket.io for instant, low-latency mutual aid alerts, ensuring neighbors can support each other in real-time within a 500m to 1km radius.

Tech Stack:
Runtime: Node.js (v20+)

Framework: Express.js (HTTP API) & Socket.io (WebSockets for real-time)

Database: PostgreSQL with PostGIS (Hosted on Supabase)

ORM: Prisma ORM with TypedSQL

Real-time: Socket.io Redis Adapter (for scalability)

Tools: Nodemon, Dotenv, Postman