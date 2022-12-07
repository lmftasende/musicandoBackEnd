module.exports = (sequelize, DataTypes) => {
  const Artista = sequelize.define("Artista",
  {
  // Definición de  columnas.
  id: {
      type: DataTypes.INTEGER,
      primaryKey: true
      },  
  nombre: {
      type: DataTypes.STRING(45)
    },  
  apellido: {
        type: DataTypes.STRING(45)
    }
  },
  // Opciones de configuración
  {
      tableName: 'artistas',
      timestamps: false,
  });
  return Artista;
}
