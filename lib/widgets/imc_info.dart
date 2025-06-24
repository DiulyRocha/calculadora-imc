import 'package:flutter/material.dart';

/// Widget que exibe as categorias do IMC com suas respectivas descrições.
///
/// Mostra as faixas de IMC e o que cada uma significa, ajudando o usuário
/// a entender seu resultado.
class imc_info extends StatelessWidget {
  const imc_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ajusta o tamanho conforme o conteúdo
        children: [
          Align(
            alignment: Alignment.center, // Centraliza apenas o título na horizontal
            child: Text(
              'Categorias de IMC',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Menos de 18,5',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          const Text(
            'Você está abaixo do peso.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 16),
          const Text(
            '18,5 a 24,9',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Você está normal.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 16),
          const Text(
            '25 a 29,9',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Você está acima do peso.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 16),
          const Text(
            '30 ou mais',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Obesidade.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}