import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator();

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _altura = TextEditingController();
  double imc = 0;
  String mensagem = 'Info';
  double alturaEmMetros = 0;

  void _imc() {
    double peso = double.tryParse(_peso.text) ?? 0;
    double altura = double.tryParse(_altura.text) ?? 0;
    alturaEmMetros = altura / 100;
    if (altura > 0) {
      imc = (peso / (alturaEmMetros * alturaEmMetros));
    } else {
      imc = 0;
    }
    if (imc > 0) {
      if (imc < 18.6) {
        mensagem = 'Abaixo do Peso';
      } else if (imc < 25) {
        mensagem = 'Peso Ideal';
      } else if (imc < 30) {
        mensagem = 'Levemente Acima do Peso';
      } else if (imc < 35) {
        mensagem = 'Obesidade Grau I';
      } else if (imc < 40) {
        mensagem = 'Obesidade Grau II';
      } else {
        mensagem = 'Obesidade Grau III';
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _peso.dispose();
    _altura.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _peso.text = '';
              _altura.text = '';
              imc = 0;
              mensagem = 'Info';
              setState(() {});
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 10),
            Icon(Icons.person_outline, size: 120.0, color: Colors.green),
            TextField(
              controller: _peso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),
            TextField(
              controller: _altura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.green, fontSize: 25.0)),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _imc,
                  child: Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                  style: TextButton.styleFrom(backgroundColor: Colors.green),
                ),
              ),
            ),
            Text(
              '$mensagem (${imc.toStringAsFixed(2)})',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
