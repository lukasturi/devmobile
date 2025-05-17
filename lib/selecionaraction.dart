import 'package:flutter/material.dart';
import 'escolhamaterial.dart'; // Importa a tela de coleta

class Selecionaraction extends StatelessWidget {
  const Selecionaraction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo(a)'),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Escolha uma opção para continuar:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Botão COLETAR (vai redirecionar para EscolhaMaterial)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EscolhaMaterial()), // Redireciona para a tela de Coleta
                );
              },
              icon: const Icon(Icons.recycling),
              label: const Text('Coletar Materiais'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),

            // Botão DOAR (não faz nada por enquanto)
            ElevatedButton.icon(
              onPressed: () {
                // Por enquanto não faz nada
                print('Botão Doar clicado, mas sem ação por enquanto.');
              },
              icon: const Icon(Icons.volunteer_activism),
              label: const Text('Doar Materiais'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade600,
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
