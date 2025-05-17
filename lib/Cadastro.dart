import 'package:flutter/material.dart';
import 'cadastroendereco.dart';  // Importando o arquivo cadastroendereco.dart

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  final TextEditingController _controllerTelefone = TextEditingController();

  bool isButtonEnabled = false;
  bool isDoadorSelected = false;
  bool isColetorSelected = false;

  // Função que verifica se todos os campos estão preenchidos
  void _checkFields() {
    setState(() {
      // Verifica se todos os campos estão preenchidos
      isButtonEnabled = _controllerNome.text.isNotEmpty &&
                        _controllerEmail.text.isNotEmpty &&
                        _controllerSenha.text.isNotEmpty &&
                        _controllerTelefone.text.isNotEmpty &&
                        (isDoadorSelected || isColetorSelected); // Verifica se ao menos uma opção foi selecionada
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro', style: TextStyle(fontSize: 35)),
        backgroundColor: const Color.fromARGB(255, 13, 199, 112),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nome
            TextField(
              controller: _controllerNome,
              decoration: InputDecoration(
                label: Text('Nome'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _checkFields(),
            ),
            SizedBox(height: 20),

            // Email
            TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                label: Text('E-mail'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _checkFields(),
            ),
            SizedBox(height: 20),

            // Senha
            TextField(
              controller: _controllerSenha,
              obscureText: true,
              decoration: InputDecoration(
                label: Text('Senha'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _checkFields(),
            ),
            SizedBox(height: 20),

            // Telefone
            TextField(
              controller: _controllerTelefone,
              decoration: InputDecoration(
                label: Text('Telefone'),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _checkFields(),
            ),
            SizedBox(height: 20),

            // Checkboxes Doador e Coletor
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: isDoadorSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isDoadorSelected = value ?? false;
                            _checkFields(); // Verifica se o botão deve ser habilitado
                          });
                        },
                      ),
                      Text(
                        'Doador',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10), // Espaçamento entre as checkboxes
                Expanded(
                  child: Row(
                    children: [
                      Checkbox(
                        value: isColetorSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            isColetorSelected = value ?? false;
                            _checkFields(); // Verifica se o botão deve ser habilitado
                          });
                        },
                      ),
                      Text(
                        'Coletor',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Botão Próximo
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        // Navegar para a próxima tela de cadastro de endereço
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CadastroEndereco()),
                        );
                      }
                    : null, // Botão desabilitado se os campos não estiverem preenchidos
                child: Text(
                  'Próximo',
                  style: TextStyle(
                    letterSpacing: 10,
                    fontSize: 25,
                    color: const Color.fromARGB(255, 4, 167, 59),
                    fontWeight: FontWeight.bold,
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
