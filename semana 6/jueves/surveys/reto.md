Un Clon De Quora

Vamos a crear un clone de la funcionalidad básica del sitio Quora. Quora es un sitio de preguntas y respuestas, donde cada usuario puede postear una pregunta y los demás pueden responder a ella. Si no conoces Quora entra a su página y familiarízate con como es que funciona.

Esta aplicación contendrá todas las características de una app moderna. Te emociona esto?

Objetivos Académicos
Crear una aplicación con todos los elementos básicos
Desarrollo de una app con varías relaciones entre recursos
Actividades
Recuerda que el desarrollo de aplicaciones y ruby se encuentran en su mayoría en ingles. Intenta que tus variables, métodos, clases, etc. se encuentre en este idioma. Solamente la interfaz podrá estar en español aunque te recomendamos la hagas también por ahora en ingles.Más adelante te enseñaremos como hacer sitios en español aunque el desarrollo de estos este en ingles.

Intenta que el flujo y diseño de Quora sea lo más parecido a tu aplicación. Quora tiene muchas features las cuales no contemplaremos, ya que solo buscaremos replicar la funcionalidad principal.

Paso 1: Usuarios(Users), Preguntas(Questions) y Respuestas(Answers)
Antes de empezar es muy importante que crees diagramas de tu aplicación. Deberás crear mínimo dos de ellos.

El primero el de tu base de datos.

Piensa cuantas tablas necesitas, que campos requiere cada una. Como están relacionadas y cuando hagas consultas como accederás a la información entre ellas.

El segundo el flujo de tu aplicación.

Esto es cuantas acciones necesitas en tus controladores. También cuantas vistas necesitas, además de escribir para que sirven y que información contienen. Finalmente como es que pasas de una a otra.

Recuerda pensar en un MVP, que funcionalidades son indispensable dentro de tu aplicación para crear un producto.

User Stories => Wireframes
Siguiendo las siguientes user stories crea los wireframes necesarios para tu app. Además del diagrama has una tabla donde especifiques la ruta o rutas o vistas y vista que estarán relacionadas con cada user story.

ej: Se en-listen todas las preguntas / ruta: questoin#index / vista: home

El cliente pide páginas donde:

Se en-listen todas las preguntas
Un lugar para crear preguntas y un lugar para que otros usuarios las respondan
Se muestre una pregunta en particular incluyendo sus respuestas
Un perfil para los usuarios
Se muestren todas las preguntas de un usuario
Se muestren todas las respuestas de un usuario, junto con la pregunta que responde
Un lugar para crear una cuenta y uno para crear una sesión
Un lugar donde el usuario pueda actualizar su información
Una lista de todos los usuarios
Modelos y Controladores
Mínimamente deberás tener los siguiente modelos:

Question
Answer
User
Por ahora no vayas a implementar respuestas de otras respuestas, si quieres deja esto para el final.

Vistas
Implementa todas tus vistas, no te preocupes por usar Ajax al principio.

Paso 2: Agrega votos

Vamos a elevar la dificultad un poco y darle más chiste a nuestra app. Para ello vamos a implementar votos dentro de las preguntas y las respuestas.

Que es Quora sin los votos?

Los usuarios deberán poder votar a favor o en contra de una pregunta, cada voto a favor incrementa un contador y cada voto en contra hace lo contrario.

Por ahora esta bien crear una tabla para los votos de las preguntas y una para las respuestas, después podrás ver si existe la posibilidad de unicamente tener una tabla.

Ahora tus modelos serán:

Question
Answer
User
QuestionVote
AnswerVote
No vayas a intentar hacer algo muy elegante donde las dos tablas de votos hereden de una clase padre, solamente te complicarás las cosas.

Vistas finales
Implementa todas las vistas y utiliza Ajax, primero para los votos, después si te queda tiempo para las respuestas.

Listo una app
