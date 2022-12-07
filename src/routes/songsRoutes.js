const express = require('express');
const router = express.Router();
const songsController = require('../controllers/songsController');

// Rutas para mostrar todas las canciones 
// /canciones (GET) que muestre un listado de las canciones con sus propiedades
router.get('/canciones', songsController.list);

//Rutas para  CRUD
// /canciones (POST) para crear un nuevo registro de una canción
router.post('/canciones', songsController.create);
// /canciones/:id (GET) que muestre una canción
router.get('/canciones/:id', songsController.read);
// /canciones/:id (PUT) para editar una canción
router.put('/canciones/:id', songsController.update);
// /canciones/:id (DELETE) para eliminar una canción
router.delete('/canciones/:id', songsController.delete);

module.exports = router;
