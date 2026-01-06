const { PrismaClient } = require('@prisma/client');
const { PrismaPg } = require('@prisma/adapter-pg');
const { Pool } = require('pg');
require('dotenv').config();

// Create a PostgreSQL connection pool
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Create the Prisma adapter
const adapter = new PrismaPg(pool);

// This instance will be reused throughout the app
// Prisma 7.x requires an adapter for direct database connections
const prisma = new PrismaClient({ adapter });

module.exports = prisma;