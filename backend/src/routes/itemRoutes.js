const express = require('express');
const router = express.Router();
const itemController = require('../controllers/itemController');

// Existing nearby route
router.get('/nearby', itemController.getItemsNearMe);

// NEW: Route to post an item
router.post('/post', itemController.createItem);

module.exports = router;