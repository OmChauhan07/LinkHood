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

const getNearbyRequests = async (req, res) => {
  const { lat, lng, radius = 1000 } = req.query;

  if (!lat || !lng) {
    return res.status(400).json({ error: 'lat and lng query params are required.' });
  }

  const radiusNum = Math.max(500, Math.min(parseInt(radius), 5000));

  try {
    const requests = await prisma.$queryRaw`
      SELECT 
        i.id, 
        i.title, 
        i.description, 
        i.category,
        i."createdAt",
        i."ownerId",
        u.name as "ownerName",
        ST_Distance(i.location, ST_MakePoint(${parseFloat(lng)}, ${parseFloat(lat)})::geography) as distance 
      FROM "Item" i
      JOIN "User" u ON i."ownerId" = u.id
      WHERE i.category = 'Request'
        AND ST_DWithin(i.location, ST_MakePoint(${parseFloat(lng)}, ${parseFloat(lat)})::geography, ${radiusNum})
      ORDER BY distance ASC
    `;

    res.json({ success: true, count: requests.length, data: requests });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Failed to fetch nearby requests.' });
  }
};

module.exports = {
  createItem,
  getItemsNearMe,
  getNearbyRequests
};
