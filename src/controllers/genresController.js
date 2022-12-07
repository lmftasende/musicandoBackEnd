const path = require('path');
const db = require('../database/models');
const sequelize = db.sequelize;
const { Op } = require("sequelize");


// Listado de todos los géneros con sus canciones
const genresController = {
    list: (req, res) => {
        db.Genero.findAll({ include: [{association: "canciones"}] })

        .then((genres)=> res.json(
                {
                    meta: 
                    { status: 200,
                       length: genres.length,
                      url: req.url
                    },
                    data: genres
                }
            )
        )

        .catch(error => res.json(
            {
                meta: 
                { status: 500,
                  url: req.url
                },
                data:error
            }
           )
        )
    }
}

module.exports = genresController;