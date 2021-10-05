/**
Queremos desarrollar un Blog de Viajes donde los usuarios se puedan registrar y
colocar sus publicaciones acerca de sus excursiones por el mundo con el fin de 
compartir sus vivencias y aventuras.
Los usuarios de tu Blog desean que le muestres una interfaz agradable y usable; 
para construir la misma recuerda usar HTML, CSS y JavaScript. El sitio tendrá 
una página principal con la lista de las 5 publicaciones más recientes, sin 
embargo, tendremos unos enlaces que permiten ver las páginas siguientes, donde 
se desplegarán las publicaciones anteriores. Adicionalemente, en la página 
principal, se tendrá una caja de búsqueda, la cual permitirá filtrar las 
publicaciones que contengan esa palabra en el título o contenido.
Cada usuario podrá votar (+1) a las publicaciones que le gusten y este número 
de votos será un dato que aparecerá al lado del título de cada publicación.
Adicionalmente, se tendrá una página que lista los autores con sus datos 
(pseudónimo, avatar y publicaciones que tiene).
Tanto en la lista de publicaciones de la página de Inicio, como en la lista de  
publicaciones de la página de Autores, se desplegará el título y un resumen de 
la misma; allí se puede hacer clic sobre la publicación para poder ver todo el 
contenido de dicha publicación incluyendo una foto del viaje.
Recuerda que los autores se deben registrar y luego iniciar sesión para manejar 
sus publicaciones (listar, crear, editar, eliminar). Cuando se registran, el 
sistema les da una Bienvenida enviándole un correo.
 */
const express = require('express');
const aplicacion = express();
const mysql = require('mysql');
const bodyParser = require('body-parser');
const session = require('express-session');
const flash = require('express-flash');

//Un pool de conexiones a la base de datos blog_viajes
var pool = mysql.createPool({
    connectionLimit: 20,
    host: 'localhost',
    user: 'root',
    password: '****',//Here put your password
    database: 'blog_viajes'
});

//El procesamiento de parámetros en el body
aplicacion.use(bodyParser.json());
aplicacion.use(bodyParser.urlencoded({ extended: true }));

//Las vistas con ejs
aplicacion.set("view engine", "ejs");


//La sesión
aplicacion.use(session({ secret: 'token-muy-secreto', resave: true, saveUninitialized: true }));
aplicacion.use(flash());

//La carpeta public
aplicacion.use(express.static('public'));

// La ruta '/' para que muestre la vista index
aplicacion.get('/', function(peticion, respuesta) {
    pool.getConnection(function(err, connection) {
        const query = "SELECT DISTINCT a.pseudonimo , p.titulo , p.resumen , p.votos , p.fecha_hora FROM autores as a, publicaciones as p WHERE a.id = p.autor_id ORDER BY p.fecha_hora DESC LIMIT 5";
        connection.query(query, function(error, filas, campos) {
            respuesta.render('index', { publicaciones: filas });
        }); //query
    }); //getConnection
}); //app->get

//Puerto 8080 escuchando a nuestra aplicación
aplicacion.listen(puerto = 8080, function() {
    console.clear();
    //Directorio Base Der LA Aplicación:\n${__dirname}\n\nArchivo del servidor en:\n${__filename}\n\n
    const mensaje = `\nServidor 'http://localhost:${puerto}/' iniciado y en espera...`;

    console.log(mensaje);
});
