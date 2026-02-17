const { Pool } = require('pg');
require('dotenv').config();

const pool = new Pool({
    connectionString: process.env.DATABASE_URL,
    ssl: { rejectUnauthorized: false },
});

async function migrate() {
    try {
        await pool.query(`
      ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "location" geography(Point, 4326)
    `);
        console.log('Added location column to User table');

        await pool.query(`
      CREATE INDEX IF NOT EXISTS "user_location_idx" ON "User" USING GIST ("location")
    `);
        console.log('Created GiST index on User.location');

        console.log('Migration completed successfully!');
    } catch (e) {
        console.error('Migration failed:', e.message);
    } finally {
        await pool.end();
    }
}

migrate();
