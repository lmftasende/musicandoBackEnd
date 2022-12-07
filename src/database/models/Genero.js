module.exports = (sequelize, DataTypes) => {
    const Genero = sequelize.define("Genero",
    {
    // Definición de  columnas.
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true
        },  
    name: {
            type: DataTypes.STRING(45)
        },  
    },
    // Opciones de configuración
    {
        tableName: 'generos',
        timestamps: false,
    });
    // Un genero tiene muchas canciones

    Genero.associate = function(modelos){
        Genero.hasMany(modelos.Cancion, {
            as: "canciones",
            foreignKey: "genero_id"
        });
    }

    return Genero;
}
