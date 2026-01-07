const prisma = require('../services/prisma');
// const { getNearbyItems } = require('@prisma/client/sql'); // Import the typed query - Temporarily disabled

const getItemsNearMe = async (req, res) => {
  // We get the user's GPS coords from the request
  const { lat, lng, radius = 1000 } = req.query; 

  try {
    // Execute the raw SQL query directly as a workaround
    const items = await prisma.$queryRaw`
      SELECT 
        id, 
        title, 
        description, 
        ST_Distance(location, ST_MakePoint(${parseFloat(lng)}, ${parseFloat(lat)})::geography) as distance 
      FROM "Item"
      WHERE ST_DWithin(location, ST_MakePoint(${parseFloat(lng)}, ${parseFloat(lat)})::geography, ${parseInt(radius)})
      ORDER BY distance ASC
    `;
    
    res.json({ success: true, count: items.length, data: items });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Failed to fetch nearby items." });
  }
};

module.exports = { getItemsNearMe };