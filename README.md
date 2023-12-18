# Trivia Goat
Trivia Goat es un juego de interfaz de usuario sobre miles de preguntas.

## Pantallas

### Pantalla de espera
<img src="https://github.com/wikispiders/trivia-goat/assets/65830097/a51935e8-aeff-42cc-8771-7a971259e4b7.gif" alt="Texto Alternativo" width="200" />

### Home

<img src='https://github.com/wikispiders/trivia-goat/assets/65830097/b3aed37f-6b5d-4577-8d9e-e9d6a7dee15d' width='200'>



### Empezar Partida
<img src='https://github.com/wikispiders/trivia-goat/assets/65830097/57d8823d-ecd4-439d-996c-c4b04bc467c1' width='200'>



### Unirse a una Partida
<img src='https://github.com/wikispiders/trivia-goat/assets/65830097/64987388-525f-40fe-8ab1-dd3c81b6ce7a' width='200'>



### Comenzando la Partida

<img src="https://github.com/wikispiders/trivia-goat/assets/65830097/bdd3431e-70f1-42ec-936a-5ac11098c0ba.gif" alt="Texto Alternativo" width="200" />


### La Partida

<img src="https://github.com/wikispiders/trivia-goat/assets/65830097/2e579c05-732d-46c0-821c-ec91168d32f2.gif" alt="Texto Alternativo" width="200" />


### Fin de Partida

<img src="https://github.com/wikispiders/trivia-goat/assets/65830097/c47124bd-c0ce-4083-b1d9-709532240bad.gif" alt="Texto Alternativo" width="200" />



## Configuración
Se debe agregar un archivo `.env` en la raíz del proyecto, el cual contiene el host del backend. Mostramos a continuación un ejemplo del mismo.

```bash
BACKEND=wss://trivia-backend-p4o1.onrender.com
```

Si se está ejecutando el proyecto en un ambiente de desarrollo, puede ser preferible usar el siguiente `.env`.


```bash
BACKEND=ws://<IP Servidor>:<Puerto Servidor>
```

Por ejemplo, si la ip del server es 192.168.160.0 y el puerto 4040, usar `BACKEND=ws://192.168.160.0:4040`.


### Instalación Android

Para compilar el proyecto, ejecutar.

```bash
flutter build apk
```

Luego, conectar el celular Android en el cual se quiere instalar la aplicación y habilitar la transferencia de archivos, junto con la depuración USB en el modo desarrollador.

Ejecutar 

```bash
flutter install
```


### Instalación Linux

```bash
flutter build linux
```

## Ejecución en modo desarrollo - Hot Reload
Ejecutar desde la raiz del proyecto:

```shell
flutter run -d all
```

La aplicación se ejecutará en todos los dispositivos conectados. Si se quiere ejecutar solo en web por ejemplo, se puede ejecutar:

```shell
flutter run -d chrome
```

Solo para linux:

```shell
flutter run -d linux
```


## Despliegue en Firebase
Si se quiere desplegar la aplicación cliente web en la nube de Firebase, seguir los siguientes pasos.
Recuerde seguir los pasos de la sección Configuración antes del despliegue.


1. Crear un proyecto en (Firabase Console)[https://console.firebase.google.com/]
2. Vincular el proyecto con el directorio siguiendo los siguientes pasos.

```bash
firebase init
```

Luego, seleccionar la siguiente opción con la barra espaciadora:

```bash
Hosting: Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys
```


Completar las preguntas con las siguientes respuestas

```bash
Please select an option: Use an existing project
Select a default Firebase project for this directory: <elegir el nombre del proyecto en Firebase>
What do you want to use as your public directory? build/web
Configure as a single-page app (rewrite all urls to /index.html)? Yes
Set up automatic builds and deploys with GitHub? No
```

Uniendo todo, se debería observar el siguiente output:


```bash
$ firebase init

     ######## #### ########  ######## ########     ###     ######  ########
     ##        ##  ##     ## ##       ##     ##  ##   ##  ##       ##
     ######    ##  ########  ######   ########  #########  ######  ######
     ##        ##  ##    ##  ##       ##     ## ##     ##       ## ##
     ##       #### ##     ## ######## ########  ##     ##  ######  ########

You're about to initialize a Firebase project in this directory:

  /trivia-goat

? Which Firebase features do you want to set up for this directory? Press Space to select features, then Enter to confirm your choices. Hosting: 
Configure files for Firebase Hosting and (optionally) set up GitHub Action deploys

=== Project Setup

First, let's associate this project directory with a Firebase project.
You can create multiple project aliases by running firebase use --add, 
but for now we'll just set up a default project.

? Please select an option: Use an existing project
? Select a default Firebase project for this directory: trivia-goat-develop (trivia-goat-develop)
i  Using project trivia-goat-develop (trivia-goat-develop)

=== Hosting Setup

Your public directory is the folder (relative to your project directory) that
will contain Hosting assets to be uploaded with firebase deploy. If you
have a build process for your assets, use your build's output directory.

? What do you want to use as your public directory? build/web
? Configure as a single-page app (rewrite all urls to /index.html)? Yes
? Set up automatic builds and deploys with GitHub? No
✔  Wrote build/web/index.html

i  Writing configuration info to firebase.json...
i  Writing project information to .firebaserc...

✔  Firebase initialization complete!
```


3. Compilar el código Dart a Javascript usando el compilador `dart2js`

```bash
flutter build web
```

Este comando crea un único archivo en `/build/web/main.dart.js` que contiene el código fuente traducido a javascript.

4. Subimos este archivo junto con los assets a Firebase con el siguiente comando.

```bash
firebase deploy
```

