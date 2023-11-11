import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
    void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
  var favorites = <WordPair>[];
  var instructions = "Deben adivinar entre las opciones qué personaje dijo la FRASE ICONIC! El participante que más frases acierte será el GANADOR";

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'WHO SAID THAT?',  // Título deseado
              style: TextStyle(
                fontWeight: FontWeight.bold,  // Aplicar estilo de negrita
                color: Colors.white,  // Color rosa
              ),
            ),
            centerTitle: true,  // Centrar el título
            backgroundColor: Theme.of(context).primaryColor,  // Color del fondo del AppBar
          ),
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        
        );
      }
    );
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var instru= appState.instructions;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.star_border;
    } else {
      icon = Icons.star;
    }
    
    
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
                  'Frases Icónicas de la Farándula Argentina',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink, 
                  ),
                ),
          SizedBox(height: 20),
          Image.network(
          'https://media.tiempodesanjuan.com/p/b8bdfc6d7ae1ddf9d789e43859ea8be8/adjuntos/331/imagenes/000/035/0000035319/790x0/smart/657342jpg.jpg',
          width: 300,  // Ajusta el ancho según tus necesidades
          height: 300, // Ajusta la altura según tus necesidades
        ),
        // Fin de la imagen
         SizedBox(height: 20),
          Instructions(instru: instru),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 20),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text(
                  'PLAY',
                  style: TextStyle(fontSize: 20),  // Ajusta el tamaño del texto según tus necesidades
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.all(20),  // Ajusta el relleno del botón según tus necesidades
                  ),
                  elevation: MaterialStateProperty.all<double>(10),  // Ajusta la elevación para agregar sombra
                ),
              ),


              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class Instructions extends StatelessWidget {
  const Instructions({
    super.key,
    required this.instru,
  });

  final String instru;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

        return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '¿Como Jugar?',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  instru,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
    
    ),
        );
  }
}
/*
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);  
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
         child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
*/ 
class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}