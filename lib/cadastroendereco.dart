import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login.dart';  // Importe a tela de login

class CadastroEndereco extends StatefulWidget {
  const CadastroEndereco({super.key});

  @override
  State<CadastroEndereco> createState() => _CadastroEnderecoState();
}

class _CadastroEnderecoState extends State<CadastroEndereco> {
  final TextEditingController _controllerRua = TextEditingController();
  final TextEditingController _controllerNumero = TextEditingController();
  final TextEditingController _controllerCidade = TextEditingController();
  final TextEditingController _controllerEstado = TextEditingController();
  final TextEditingController _controllerCep = TextEditingController();

  // Função para consultar o CEP na API ViaCEP
  Future<void> _consultarCep(String cep) async {
    final url = 'https://viacep.com.br/ws/$cep/json/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _controllerRua.text = data['logradouro'] ?? '';
          _controllerCidade.text = data['localidade'] ?? '';
          _controllerEstado.text = data['uf'] ?? '';
        });
      } else {
        // Caso não encontre o CEP
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('CEP não encontrado!')),
        );
      }
    } catch (e) {
      // Caso haja algum erro ao consultar a API
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao consultar o CEP!')),
      );
    }
  }

  // Função para exibir o pop-up de sucesso e redirecionar para o login
  void _exibirPopUpSucesso() {
    showDialog(
      context: context,
      barrierDismissible: false, // Impede que o usuário feche o pop-up tocando fora
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro Realizado com Sucesso'),
          content: Text('Seu cadastro foi concluído com sucesso!'),
          actions: [
            TextButton(
              onPressed: () {
                // Redireciona para a tela de login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Endereço', style: TextStyle(fontSize: 35)),
        backgroundColor: const Color.fromARGB(255, 13, 199, 112),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo CEP
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controllerCep,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  label: Text('CEP'),
                  suffixIcon: Icon(Icons.location_on),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                ),
                style: TextStyle(fontSize: 25),
                onChanged: (value) {
                  if (value.length == 8) {
                    _consultarCep(value); // Consulta o CEP quando tiver 8 caracteres
                  }
                },
              ),
            ),
            SizedBox(height: 20),

            // Campo Rua
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controllerRua,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  label: Text('Rua'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                ),
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),

            // Campo Número
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controllerNumero,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  label: Text('Número'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                ),
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),

            // Campo Cidade
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controllerCidade,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  label: Text('Cidade'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                ),
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),

            // Campo Estado
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _controllerEstado,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  label: Text('Estado'),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 4, color: const Color.fromARGB(255, 67, 96, 107)),
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(35), right: Radius.circular(35)),
                  ),
                ),
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 20),

            // Botão de Confirmar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Exibe o pop-up de sucesso e redireciona para a tela de login
                    _exibirPopUpSucesso();
                  },
                  child: Text(
                    'Confirmar',
                    style: TextStyle(
                      letterSpacing: 10,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 4, 167, 59),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 13, 199, 112), // Cor de fundo
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
