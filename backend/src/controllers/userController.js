const prisma = require('../services/prisma');

const signup = async (req, res) => {
  const { name, email } = req.body;

  try {
    const newUser = await prisma.user.create({
      data: { name, email },
    });
    res.status(201).json({ message: "Welcome to the Hood! 🏠", user: newUser });
  } catch (error) {
    if (error.code === 'P2002') {
      return res.status(400).json({ error: "Email already exists in this neighborhood." });
    }
    res.status(500).json({ error: "Something went wrong during signup." });
  }
};

module.exports = { signup };