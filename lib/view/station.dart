import 'package:flutter/material.dart';

class Station extends StatefulWidget {
  const Station();

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  final TextEditingController _textEditeControllerAlcool =
      TextEditingController();
  final TextEditingController _textEditeControllerGasolina =
      TextEditingController();

  var result;

  void _calculateValue() {
    double alcool = double.parse(_textEditeControllerAlcool.text);
    double gasolina = double.parse(_textEditeControllerGasolina.text);
    setState(() {
      result = alcool / gasolina * 100;
    });
  }

  @override
  void dispose() {
    _textEditeControllerAlcool.dispose();
    _textEditeControllerGasolina.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('Gasolina vs Álcool', style: TextStyle(fontSize: 30)),
            Image.network(
              'https://media.tenor.com/Mrdt9WR6cGkAAAAC/over-there-there.gif',
              width: 300.0,
              height: 200.0,
            ),
            Container(
                margin: const EdgeInsets.all(10.0),
                width: 300.0,
                height: 50.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Valor do Álcool'),
                  ),
                  controller: _textEditeControllerAlcool,
                )),
            Container(
                margin: const EdgeInsets.all(10.0),
                width: 300.0,
                height: 50.0,
                child: TextField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Valor da Gasolina'),
                  ),
                  controller: _textEditeControllerGasolina,
                )),
            ElevatedButton(
              onPressed: _calculateValue,
              child: const Text('Calcular'),
            ),
            if (result != null)
              Text(
                result >= 70
                    ? 'Abastecer com Álcool!'
                    : 'Abastecer com Gasolina!',
                style: const TextStyle(fontSize: 30),
              ),
          ],
        )),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
