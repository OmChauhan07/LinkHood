const express = require('express');
const router = express.Router();
const itemController = require('../controllers/itemController');

// URL will be: GET /api/items/nearby?lat=...&lng=...
router.get('/nearby', itemController.getItemsNearMe);

module.exports = router;