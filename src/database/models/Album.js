module.exports = (sequelize, DataTypes) => {
  const Album = sequelize.define("Album",
  {
  // Definición de  columnas.
  id: {
      type: DataTypes.INTEGER,
      primaryKey: true
      },  
  nombre: {
      type: DataTypes.STRING(45)
    },  
  duracion: {
        type: DataTypes.INTEGER
    }
  },
  // Opciones de configuración
  {
      tableName: 'albumes',
      timestamps: false,
  });
  return Album;
}