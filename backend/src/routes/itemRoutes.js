const express = require('express');
const router = express.Router();
const itemController = require('../controllers/itemController');

// Existing nearby route
router.get('/nearby', itemController.getItemsNearMe);

// Nearby requests (filtered by category = 'Request')
router.get('/nearby-requests', itemController.getNearbyRequests);

// NEW: Route to post an item
router.post('/post', itemController.createItem);

module.exports = router;