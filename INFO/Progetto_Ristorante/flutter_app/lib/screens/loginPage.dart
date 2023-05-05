import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/constant.dart';
import 'package:flutter_app/screens/tavolo.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isError = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    final response = await http
        .get(Uri.parse('$url/utente?name=$username&password=$password'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body); 
      if (data['autenticato'] == true) {
        print("PORCO DI=");
        // L'utente è stato autenticato correttamente, puoi navigare alla tua pagina principale
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Tavolo()),
        );
      } else {
        // L'utente non è stato autenticato, mostra un messaggio di errore
        setState(() {
          _isLoading = false;
          _isError = true;
        });
      }
    } else {
      // Si è verificato un errore durante la richiesta HTTP, mostra un messaggio di errore
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isLoading ? null : _login,
              child: _isLoading ? CircularProgressIndicator() : Text('Accedi'),
            ),
            if (_isError) Text('Username o password non validi.'),
          ],
        ),
      ),
    );
  }
}
