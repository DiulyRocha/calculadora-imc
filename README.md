# Calculadora de IMC

Aplicativo Flutter para calcular o Índice de Massa Corporal (IMC).

## Descrição

Este projeto permite ao usuário inserir peso e altura para calcular o IMC e classificar o resultado em categorias como "Abaixo do peso", "Peso normal", "Sobrepeso" e "Obesidade".

## Funcionalidades

- Entrada de peso (kg) e altura (cm)
- Cálculo automático do IMC
- Classificação de acordo com o valor do IMC
- Seleção de gênero (masculino/feminino)
- Tela de informações com categorias de IMC
- Interface simples e responsiva

## Como usar

1. Insira seu peso em kg.
2. Insira sua altura em cm.
3. Toque em "Calcule seu IMC".
4. Veja o resultado e a classificação.
5. Use o botão para recalcular se desejar.

## Estrutura do projeto

- `lib/controllers/imc_controller.dart`: lógica do cálculo e classificação do IMC
- `lib/widgets/imc_form.dart`: formulário para entrada de dados e resultado
- `lib/widgets/imc_info.dart`: informações sobre as categorias de IMC
- `lib/screens/imc_screen.dart`: tela principal do app
- `lib/main.dart`: ponto de entrada da aplicação

## Requisitos

- Flutter SDK instalado
- Emulador ou dispositivo físico para rodar o app

## Como rodar

No terminal, dentro da pasta do projeto, execute:

```bash
flutter pub get
flutter run
