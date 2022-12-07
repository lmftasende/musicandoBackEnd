const path = require('path');
const db = require('../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");
const moment = require('moment');


const songsController = {
    list: (req, res) => {
        db.Cancion.findAll()
           
        .then((songs)=> res.json(
                {
                    meta: 
                    { status: 200,
                       length: songs.length,
                      url: req.url
                    },
                    data:songs
                })
        )
        .catch(error => res.json(
            {
                meta: 
                { status: 500,
                  url: req.url
                },
                data:error
            }
           ))
      
    },
    
    //CRUD
    create: function (req,res) {
        db.Cancion.create(
            {
                id: req.body.id,
                titulo: req.body.titulo,
                duracion: req.body.duracion,
                created_at: moment.utc().format('YYYY-MM-DD HH:mm:ss'),
                //  updated_at:NULL en la creación
                genero_id: req.body.genero_id,
                album_id: req.body.album_id,
                artista_id: req.body.artista_id
            })
        .then((song)=> res.json(
                {
                    meta: 
                    { status: 200,
                      url: req.url
                    },
                    data:song
                })
        )
          
        .catch(error => res.json(
            {
                meta: 
                { status: 500,
                  url: req.url
                },
                data:error
            }
           ))
    },

    read: (req, res) => {
        db.Cancion.findByPk(req.params.id)
           
        .then((song)=> res.json(
                {
                    meta: 
                    { status: 200,
                      url: req.url
                    },
                    data:song
                })
        )
        .catch(error => res.json(
            {
                meta: 
                { status: 500,
                  url: req.url
                },
                data:error
            }
           ))
        
    },

    update: function (req,res) {
        let songId = req.params.id;
        db.Cancion.update(
            {
                titulo: req.body.titulo,
                duracion: req.body.duracion,
                updated_at: moment.utc().format('YYYY-MM-DD HH:mm:ss'),
                genero_id: req.body.genero_id,
                album_id: req.body.album_id,
                artista_id: req.body.artista_id
            },
            {
                where: {id: songId}
            })
            .then((song)=> res.json(
                {
                  meta: { 
                        status: 200,
                        url: req.url
                    },
                        data:song
                })
            )
              
            .catch(error => res.json(
                {
                    meta: 
                    { status: 500,
                      url: req.url
                    },
                    data:error
                }
               ))
    },
    delete: function (req,res) {
        let songId = req.params.id;
        db.Cancion.destroy(
            {
                where: {id: songId}
            })
            .then((song)=> res.json(
                {
                  meta: { 
                        status: 200,
                        url: req.url
                    },
                        data:song
                })
            )
              
            .catch(error => res.json(
                {
                    meta: 
                    { status: 500,
                      url: req.url
                    },
                    data:error
                }
               ))

    }
}

module.exports = songsController;