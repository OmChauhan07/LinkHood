const prisma = require('../services/prisma');

const createItem = async (req, res) => {
  const { title, description, category, lat, lng, ownerId } = req.body;

  try {
    // We use $executeRaw to handle the PostGIS geometry point correctly
    await prisma.$executeRaw`
      INSERT INTO "Item" (id, title, description, category, location, "ownerId", "createdAt")
      VALUES (
        gen_random_uuid(), 
        ${title}, 
        ${description}, 
        ${category}, 
        ST_SetSRID(ST_MakePoint(${lng}, ${lat}), 4326)::geography, 
        ${ownerId}, 
        NOW()
      )
    `;

    res.status(201).json({ success: true, message: "Item posted to the hood! 🛠️" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Could not post item. Check your coordinates." });
  }
};

const getItemsNearMe = async (req, res) => {
  const { lat, lng, radius = 1000 } = req.query;

  try {
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

module.exports = { 
  createItem, 
  getItemsNearMe
};
