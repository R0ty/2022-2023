import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/registerPage.dart';
import '../model/constant.dart';
import '../screens/tavolo.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isError = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    final String name = _nameController.text;
    final String password = _passwordController.text;

    final body = {"name": name, "password": password};
    var headers = {'Content-Type': 'application/json'};

    final response = await http.post(Uri.parse('$url/utente'),
        body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data['autenticato'] == true) {
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
        centerTitle: true,
        title: Text('Login', style: TextStyle(fontSize: 50)),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                style: TextStyle(color: bianco),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: bianco),
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: bianco)),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: bianco)),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                style: TextStyle(color: bianco),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: bianco),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: bianco),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: bianco),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                // Add login
                onPressed: _isLoading
                    ? null
                    : _login, // _isLoading ? NULL : _login if in Linea se è true fa log
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Accedi',
                        style: TextStyle(color: Colors.black),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: bianco,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: bianco),
                  onPressed: () => Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => RegisterPage())),
                  child: Text(
                    'Registrati',
                    style: TextStyle(color: nero),
                  )),
              if (_isError) Text('Username o password non validi.'),
            ],
          ),
        ),
      ),
    );
  }
}
