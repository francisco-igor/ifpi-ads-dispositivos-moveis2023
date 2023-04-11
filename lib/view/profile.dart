import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile();

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const SizedBox(height: 30),
          const Text(
            'Dados',
            style: TextStyle(fontSize: 30),
          ),
          Container(
              margin: const EdgeInsets.all(10.0),
              width: 300.0,
              height: 50.0,
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nome'),
                ),
                controller: _nomeController,
              )),
          Container(
              margin: const EdgeInsets.all(10.0),
              width: 300.0,
              height: 50.0,
              child: TextField(
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email'),
                ),
                controller: _emailController,
              )),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnotherPage(
                    nome: _nomeController.text,
                    email: _emailController.text,
                  ),
                ),
              );
            },
            child: const Text('Enviar'),
          )
        ]),
      ),
    );
  }
}

class AnotherPage extends StatefulWidget {
  final String nome;
  final String email;

  const AnotherPage({required this.nome, required this.email});

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://pop.proddigital.com.br/wp-content/uploads/sites/8/2022/08/chris-evans-disney-plus.jpg',
              width: 500,
              height: 300,
            ),
            Text(
              'Nome: ${widget.nome}',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Email: ${widget.email}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
