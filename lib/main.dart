import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  int _suma = 0;

  void _sumar() {
    setState(() {

      _suma = int.parse(_numero1.text) + int.parse(_numero2.text);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),

        title: Text(widget.title),
        actions: [
          Icon(Icons.calculate_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
          Icon(Icons.more_vert),
        ],
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
      padding : const EdgeInsets.symmetric(horizontal:100, vertical: 30),
      child: Center(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _numero1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'digite el primer numero'
              ),
            ),
            const SizedBox(
              height:20,
            ),
            TextFormField(
              controller: _numero2,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite El Segundo Numero'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'La Suma es: $_suma',
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
