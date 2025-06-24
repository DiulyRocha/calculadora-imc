import 'package:flutter/material.dart';
import '../widgets/imc_form.dart';

/// Tela principal do aplicativo que exibe o formulário de cálculo do IMC.
///
/// Contém uma AppBar com título e botão voltar (se possível) e o widget
/// [ImcForm] no corpo da tela.
class ImcScreen extends StatelessWidget {
  const ImcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu Corpo'),
        // Exibe botão voltar se houver tela anterior na pilha de navegação
        leading: Navigator.canPop(context) // Verifica se há uma tela anterior
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        )
            : null, // Oculta botão caso não haja tela anterior
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: ImcForm(),
      ),
    );
  }
}