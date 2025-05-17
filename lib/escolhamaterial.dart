import 'package:flutter/material.dart';
import 'login.dart';
import 'perfil.dart';
import 'listdoador.dart';

class EscolhaMaterial extends StatefulWidget {
  const EscolhaMaterial({super.key});

  @override
  State<EscolhaMaterial> createState() => _EscolhaMaterialState();
}

class _EscolhaMaterialState extends State<EscolhaMaterial> {
  final Map<String, bool> _materiaisSelecionados = {
    'Garrafa PET': false,
    'Óleo de cozinha': false,
    'Tampinha de Plástico': false,
    'Lata de Alumínio': false,
  };

  @override
  Widget build(BuildContext context) {
    final int horaAtual = DateTime.now().hour;
    String saudacao =
        (horaAtual >= 5 && horaAtual < 12) ? "Bom dia" : "Boa noite";

    bool algumSelecionado = _materiaisSelecionados.containsValue(true);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Green Code',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF81C784), // Verde claro
                Color(0xFF388E3C), // Verde médio escuro
                Color.fromARGB(255, 74, 110, 76), // Verde escuro
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'perfil') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Perfil()),
                );
              } else if (value == 'sair') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const Login()),
                );
              }
            },
            icon: const Icon(Icons.dehaze, size: 28, color: Colors.white),
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                value: 'perfil',
                child: ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Perfil'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'sair',
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Sair'),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: const Color(0xFFE8F5E9),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              saudacao,
              style: const TextStyle(
                fontSize: 35,
                color: Color.fromARGB(255, 74, 110, 76),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Qual material você deseja coletar hoje?',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 74, 110, 76),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            // Checkboxes
            ..._materiaisSelecionados.entries.map((entry) {
              return _buildCheckbox(entry.key, entry.value);
            }).toList(),

            const SizedBox(height: 20),

            if (algumSelecionado)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PerfisCorrespondentes(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  label: const Text(
                    'Próximo',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // ← Texto branco
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 4, 167, 59),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox(String titulo, bool selecionado) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 167, 59),
          borderRadius: BorderRadius.circular(15),
        ),
        child: CheckboxListTile(
          value: selecionado,
          onChanged: (bool? novoValor) {
            setState(() {
              _materiaisSelecionados[titulo] = novoValor ?? false;
            });
          },
          title: Text(
            titulo,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.white,
          checkColor: Colors.green,
        ),
      ),
    );
  }
}
