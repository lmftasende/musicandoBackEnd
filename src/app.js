const express = require('express');
const path = require('path');
const app = express();

app.use(express.urlencoded({ extended: false })); 
app.use(express.json());

// Definición de las rutas
const songsRoutes = require('./routes/songsRoutes');
const genresRoutes = require('./routes/genresRoutes');

// Uso de la rutas de las APIs
app.use(songsRoutes);
app.use(genresRoutes);

//Activación del servidor desde express
app.listen('3001', () => console.log('Servidor corriendo en el puerto 3001'));
