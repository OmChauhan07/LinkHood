const { PrismaClient } = require('@prisma/client');

// This instance will be reused throughout the app
const prisma = new PrismaClient();

module.exports = prisma;