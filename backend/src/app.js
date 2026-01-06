const express = require('express');
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');
const userRoutes = require('./routes/userRoutes');

const app = express();
const prisma = new PrismaClient();

app.use(cors());
app.use(express.json());
app.use('/api/users', userRoutes);

app.get('/', (req, res) => {
  res.send('LinkHood Backend is Live! 🚀');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});