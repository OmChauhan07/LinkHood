-- Add location column to User table
ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "location" geography(Point, 4326);

-- Add passwordHash column if missing (from previous schema update)
ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "passwordHash" TEXT;

-- Add updatedAt column if missing
ALTER TABLE "User" ADD COLUMN IF NOT EXISTS "updatedAt" TIMESTAMP(3);

-- Create GiST index on user location
CREATE INDEX IF NOT EXISTS "user_location_idx" ON "User" USING GIST ("location");
