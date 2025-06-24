import 'package:calculadora_im/widgets/imc_info.dart';
import 'package:flutter/material.dart';
import '../controllers/imc_controller.dart';

/// Widget de formulário para entrada de peso e altura, cálculo e exibição do IMC.
///
/// Permite ao usuário inserir peso (kg) e altura (cm), selecionar gênero, calcular o IMC,
/// exibir o resultado e acessar uma tela com informações adicionais.
class ImcForm extends StatefulWidget {
  const ImcForm({super.key});

  @override
  State<ImcForm> createState() => _ImcFormState();
}

class _ImcFormState extends State<ImcForm> {
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String? resultado;
  String? selecionado =  'male'; // 'masculino' ou 'feminino'

  /// Calcula o IMC usando os valores dos campos e atualiza o resultado na tela.
  void calcularIMC() {
    FocusScope.of(context).unfocus(); // Fecha o teclado numérico
    final String pesoTexto = pesoController.text;
    final String alturaTexto = alturaController.text;

    String res = ImcController.calcular(pesoTexto, alturaTexto);
    setState(() {
      resultado = res;
    });
  }

  /// Atualiza o gênero selecionado
  void selecionarGenero(String genero) {
    setState(() {
      selecionado = genero;
    });
  }

  /// Reseta o formulário, limpando campos e resultado, e volta o gênero para padrão.
  void resetarFormulario() {
    setState(() {
      resultado = null; // Oculta o resultado
      pesoController.clear(); // Limpa o peso
      alturaController.clear(); // Limpa a altura
      selecionado = 'male'; // Mantém "Masculino" selecionado por padrão
    });
  }

  /// Navega para a tela com informações adicionais.
  void mostrarInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('Seu Corpo'), // Mantém a mesma AppBar
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: const imc_info(), // Insere a tela de informações aqui
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho com título e botão de informações
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Calculadora IMC',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.info_rounded),
                onPressed: mostrarInfo,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Seleção de gênero (masculino/feminino) com imagens e destaque
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Masculino
              Column(
                children: [
                  GestureDetector(
                    onTap:  resultado == null ? () => selecionarGenero('male') : null,
                    child: Opacity(
                      opacity: selecionado == 'male' ? 1.0 : 0.3, // Ícone esmaecido quando não selecionado
                      child: Image.asset(
                        'assets/images/male.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Espaço entre imagem e texto
                  Text(
                    'Masculino',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: selecionado == 'male' ? FontWeight.bold : FontWeight.normal, // Nome destacado quando selecionado
                      color: Colors.black, // Mantém a cor neutra
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 100),

              // Feminino
              Column(
                children: [
                  GestureDetector(
                    onTap: resultado == null ? () => selecionarGenero('female') : null,
                    child: Opacity(
                      opacity: selecionado == 'female' ? 1.0 : 0.3, // Ícone esmaecido quando não selecionado
                      child: Image.asset(
                        'assets/images/female.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8), // Espaço entre imagem e texto
                  Text(
                    'Feminino',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: selecionado == 'female' ? FontWeight.bold : FontWeight.normal, // Nome destacado quando selecionado
                      color: Colors.black, // Mantém a cor neutra
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Campos para entrada de peso e altura
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Seu Peso (kg)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    TextField(
                      controller: pesoController,
                      enabled: resultado == null, // desabilita se resultado já foi calculado
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 30),
                      decoration: const InputDecoration(
                        hintText: '80', // Sugestão de peso
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.1), // Preto com 10% de opacidade
                        ),
                        border: InputBorder.none, // Remove a borda
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sua Altura (cm)',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    TextField(
                      controller: alturaController,
                      enabled: resultado == null, // desabilita se resultado já foi calculado
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 30),
                      decoration: const InputDecoration(
                        hintText: '175', // Sugestão de altura
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.1), // Preto com 10% de opacidade
                        ),
                        border: InputBorder.none, // Remove a borda
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Botão para calcular ou exibição do resultado com opção de resetar
          resultado == null
            ? SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcularIMC,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Fundo azul
                  foregroundColor: Colors.white, // Texto branco
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Cantos arredondados
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                child: const Text('Calcule seu IMC'),
              ),
            )
            : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (resultado!.contains('\n'))...[
                    const Text(
                      'Seu IMC',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      resultado!.split('\n')[0], // Exibe apenas o valor do IMC
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      resultado!.split('\n')[1], // Exibe classificação
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ] else...[
                    Text(
                      resultado!, // Mostra a mensagem de erro
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: resetarFormulario, // Chama a função ao clicar
                    child: const Text(
                      'Calcule IMC novamente',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue, // Texto azul
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