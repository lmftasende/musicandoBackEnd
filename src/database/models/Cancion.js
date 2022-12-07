module.exports = (sequelize, DataTypes) => {
  const Cancion = sequelize.define("Cancion",
  {
      // Definición de  columnas.
      id: {
        type: DataTypes.INTEGER,
        primaryKey: true
        },  
      titulo: {
        type: DataTypes.TEXT
        },  
      duracion: {
        type: DataTypes.INTEGER
        },  
      created_at: {
        type: DataTypes.DATE
        },  
      updated_at: {
          type: DataTypes.DATE
        },  
      genero_id: {
          type: DataTypes.INTEGER
        },  
      album_id: {
          type: DataTypes.INTEGER
        },  
      artista_id: {
          type: DataTypes.INTEGER
        }
      },
      // Opciones de configuración
      {
          tableName: 'canciones',
          timestamps: false,
      });


      Cancion.associate = function(modelos){
        // Una canción tiene un genero
        Cancion.belongsTo(modelos.Genero, {
          as: "generos",
          foreignKey: "genero_id"
        });

        // Una canción tiene un album
        Cancion.belongsTo(modelos.Album, {
          as: "albumes",
          foreignKey: "album_id"
        });
        
        // Una canción tiene un artista
        Cancion.belongsTo(modelos.Artista, {
          as: "artistas",
                  foreignKey: "artista_id"
                })
      }
      
      return Cancion;
}

