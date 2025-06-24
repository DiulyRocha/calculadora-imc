/// Classe responsável pelo cálculo do IMC (Índice de Massa Corporal).
class ImcController {

  /// Calcula o IMC com base nos valores de peso (kg) e altura (cm) informados como String.
  ///
  /// Retorna uma string com o valor do IMC formatado e sua classificação.
  /// Em caso de erro de entrada, retorna uma mensagem explicando o problema.
  static String calcular(String pesoTexto, String alturaTexto) {

    // Remove espaços desnecessários
    pesoTexto = pesoTexto.trim();
    alturaTexto = alturaTexto.trim();

    // Tenta converter as entradas para double
    double? peso = double.tryParse(pesoTexto);
    double? altura = double.tryParse(alturaTexto);

    // Validação de entrada
    if (peso == null || altura == null) {
      return 'Peso e altura devem ser números válidos.';
    }

    if (peso <= 0 || altura <= 0) {
      return 'Peso e altura devem ser maiores que zero.';
    }

    // Cálculo do IMC
    double imc = peso / ((altura / 100) * (altura / 100));

    // Classificação do IMC
    String classificacao;
    if (imc < 18.5) {
      classificacao = 'Abaixo do peso';
    } else if (imc < 24.9) {
      classificacao = 'Peso normal';
    } else if (imc < 29.9) {
      classificacao = 'Sobrepeso';
    } else if (imc >= 30.0) {
      classificacao = 'Obesidade';
    } else {
      classificacao = '';
    }

    // Retorna o resultado formatado
    return '${imc.toStringAsFixed(1)}\n$classificacao';
  }
}