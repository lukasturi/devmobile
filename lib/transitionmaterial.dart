import 'package:flutter/material.dart';
import 'selecionaraction.dart'; // Verifique o nome e caminho do arquivo da próxima tela.

class TransitionMaterial extends StatefulWidget {
  const TransitionMaterial({super.key});

  @override
  _TransitionMaterialState createState() => _TransitionMaterialState();
}

class _TransitionMaterialState extends State<TransitionMaterial> {
  @override
  void initState() {
    super.initState();
    // Inicia a navegação após 3 segundos.
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Selecionaraction()), // Corrigir nome da classe
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Fundo com imagem
          Image.asset(
            'images/reciclagem.png', // Certifique-se de que o caminho da imagem está correto
            fit: BoxFit.cover,
          ),

          // Conteúdo centralizado por cima da imagem
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Green Code',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 111, 161, 114),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Inovação que transforma o futuro, tecnologia que respeita o planeta.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 111, 161, 114),
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
