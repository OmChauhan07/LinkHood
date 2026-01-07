-- @param {Float} $1:longitude
-- @param {Float} $2:latitude
-- @param {Int} $3:radiusInMeters

SELECT 
  id, 
  title, 
  description, 
  -- Calculate distance in meters using PostGIS
  ST_Distance(location, ST_MakePoint($1, $2)::geography) as distance 
FROM "Item"
-- Only return items within the specified walking radius
WHERE ST_DWithin(location, ST_MakePoint($1, $2)::geography, $3)
ORDER BY distance ASC;