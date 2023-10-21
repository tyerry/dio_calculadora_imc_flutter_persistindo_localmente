class Imc {
  late String nome;
  late double peso;
  late double altura;
  late String resultado;
  late String estadoSaude;

  Imc(String nome, double peso, double altura) {
    String resultadoCalculo = (peso / (altura * altura)).toStringAsFixed(2);
    double resultadoTabela = double.tryParse(resultadoCalculo) ?? 0.0;

    switch (resultadoTabela) {
      case < 16:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado magreza grave!';
        estadoSaude = 'magreza grave';
      case >= 16 && < 17:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado magreza moderada!';
        estadoSaude = 'magreza moderada';
      case >= 17 && < 18.5:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado magreza leve!';
        estadoSaude = 'magreza leve';
      case >= 18.5 && < 25:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado saudável!';
        estadoSaude = 'saudável';
      case >= 25 && < 30:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado sobrepeso!';
        estadoSaude = 'sobrepeso';
      case >= 30 && < 35:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 1!';
        estadoSaude = 'obesidade grau 1';
      case >= 35 && < 40:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 2 (severa)!';
        estadoSaude = 'obesidade grau 2';
      case >= 40:
        resultado =
            'Atenção $nome! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 3 (mórbida)!';
        estadoSaude = 'obesidade grau 3';
      default:
        resultado = 'Resultado inconclusivo!';
        estadoSaude = '-';
    }
  }
}
