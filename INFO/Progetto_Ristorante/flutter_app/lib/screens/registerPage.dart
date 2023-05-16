import 'package:flutter/material.dart';
import 'package:flutter_app/screens/loginPage.dart';
import '../model/constant.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isError = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
      _isError = false;
    });

    final String name = _nameController.text;
    final String password = _passwordController.text;

    final response = await http.post(
      Uri.parse('$url/register/$name/$password'),
    );
    if (response.statusCode == 200) {
      // L'utente è stato autenticato correttamente, puoi navigare alla tua pagina principale
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
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
        title: Text('Register', style: TextStyle(fontSize: 50)),
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
                    : _register, // _isLoading ? NULL : _register if in Linea se è true fa log
                child: _isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        'Registrati',
                        style: TextStyle(color: Colors.black),
                      ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: bianco,
                ),
              ),
              if (_isError) Text('Username o password non validi.'),
            ],
          ),
        ),
      ),
    );
  }
}
