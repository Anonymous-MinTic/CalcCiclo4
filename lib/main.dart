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

enum Operacion { sumar, restar, multiplicar, dividir }

class _MyHomePageState extends State<MyHomePage> {
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  int _total = 0;

  void _calcular(Enum operacion) {
    setState(() {
      switch (operacion) {
        case Operacion.sumar:
          _total = int.parse(_numero1.text) + int.parse(_numero2.text);
          break;
        case Operacion.restar:
          int.parse(_numero1.text) - int.parse(_numero2.text);
          break;
        case Operacion.multiplicar:
          int.parse(_numero1.text) * int.parse(_numero2.text);
          break;
        case Operacion.dividir:
          int.parse(_numero1.text) ~/ int.parse(_numero2.text);
          break;
      }
      _total = int.parse(_numero1.text) + int.parse(_numero2.text);
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _numero1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'digite el primer numero'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _numero2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite El Segundo Numero'),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.sumar);
                    },
                    child: const Text('+')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.restar);
                    },
                    child: const Text('-')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.multiplicar);
                    },
                    child: const Text('*')),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.dividir);
                    },
                    child: const Text('/')),
                const SizedBox(
                  width: 20,
                ),
              ]),
              Text(
                'El resultado es: $_total',
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
