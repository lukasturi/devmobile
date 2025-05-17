import 'package:flutter/material.dart';
import 'package:pizzaria/redefinirpassword.dart';
import 'package:pizzaria/Cadastro.dart';
import 'package:pizzaria/transitionmaterial.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  String email = '', senha = '';
  bool validacao = false;
  bool _obscureText = true;

  void _toogleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  consultaApiSenha() async {
    String url = 'http://192.168.15.82:3000/usuarios';

    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String responseBody = utf8.decode(response.bodyBytes);
        List<dynamic> usuarios = json.decode(responseBody);
        var usuario = usuarios.firstWhere(
          (user) =>
              user['email'] == _controllerEmail.text &&
              user['senha'] == _controllerSenha.text,
          orElse: () => null,
        );

        validacao = usuario != null;
      }
    } catch (e) {
      // erro geral
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerEmail.text = 'leo@email.com';
    _controllerSenha.text = '32';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Greencode',
          style: TextStyle(fontSize: 35, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF81C784),
                Color(0xFF388E3C),
                Color.fromARGB(255, 74, 110, 76),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'images/reciclafolha.png',
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        suffixIcon: const Icon(Icons.mail_lock),
                        label: const Text('E-mail'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 4,
                              color: Color.fromARGB(255, 67, 96, 107)),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(35),
                              right: Radius.circular(35)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 4,
                              color: Color.fromARGB(255, 67, 96, 107)),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(35),
                              right: Radius.circular(35)),
                        ),
                      ),
                      style: const TextStyle(fontSize: 25),
                      controller: _controllerEmail,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      obscureText: _obscureText,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        suffixIcon: IconButton(
                          onPressed: _toogleVisibility,
                          icon: Icon(_obscureText
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        label: const Text('Senha'),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 4,
                              color: Color.fromARGB(255, 67, 96, 107)),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(35),
                              right: Radius.circular(35)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 4,
                              color: Color.fromARGB(255, 67, 96, 107)),
                          borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(35),
                              right: Radius.circular(35)),
                        ),
                      ),
                      style: const TextStyle(fontSize: 25),
                      controller: _controllerSenha,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TransitionMaterial()),
                          );
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            letterSpacing: 10,
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 4, 167, 59),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RedefinirPassword()),
                      );
                    },
                    child: const Text(
                      'Recuperar a Senha',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 74, 110, 76),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cadastro()),
                      );
                    },
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 74, 110, 76),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF81C784),
                    Color(0xFF388E3C),
                    Color.fromARGB(255, 74, 110, 76),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                  height: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
