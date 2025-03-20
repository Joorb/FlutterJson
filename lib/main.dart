import 'dart:math';
import 'package:flutter/material.dart';
import 'package:app_jason_jrl/filmes.dart'; // import para usar o json
import 'dart:convert'; 
import 'package:flutter/services.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState(); // Definir a classe de estado
}

class _MainAppState extends State<MainApp> { // Alterei o nome da classe de estado para corresponder
  bool mostrarFilme = false;
  List<Filmes> filmes = List.empty();
  Filmes filmeSorteado = Filmes();
  int total = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/movies.json');
    Iterable data = await json.decode(response);
    filmes = List<Filmes>.from(data.map((model) => Filmes.fromJson(model)));
    total = filmes.length;
    setState(() {}); // Atualiza a interface
  }

  void sorteiaFilme() {
    var r = Random();
    var index = r.nextInt(filmes.length);
    filmeSorteado = filmes[index];
    mostrarFilme = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    readJson(); // Carregar os filmes ao iniciar
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Sorteio de Filmes')),
        body: Center(
          child: mostrarFilme
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Filme Sorteado: ${filmeSorteado.titulo}', // Supondo que o campo seja 'titulo' no seu modelo Filmes
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(
                      'Total de Filmes: $total',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
                
              :       ElevatedButton(
                      onPressed: sorteiaFilme,
                      child: const Text('Sortear Novo Filme'),
                    ),
        ),
      ),
    );
  }
}
