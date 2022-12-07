const express = require('express');
const router = express.Router();
const genresController = require('../controllers/genresController');

// Rutas para mostrar todas las canciones 
// /generos (GET) listado de todos los géneros con sus canciones
router.get('/generos', genresController.list);

module.exports = router;
