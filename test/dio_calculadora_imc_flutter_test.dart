import 'package:dio_calculadora_imc_flutter/shared/imc.dart';
import 'package:dio_calculadora_imc_flutter/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testando widget Custom Text Field', () {
    testWidgets('CustomTextField', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              CustomTextField(
                  label: 'Label Teste',
                  hint: 'Hint Teste',
                  controller: TextEditingController(text: 'ABCDEFGHIJ'),
                  textType: TextInputType.name),
            ],
          ),
        ),
      ));

      final customTextField = find.byType(CustomTextField);
      expect(customTextField, findsOneWidget);
      await tester.enterText(find.byType(TextField), 'Texto Inserido Teste');
      expect(find.text('Texto Inserido Teste'), findsOneWidget);
    });
  });

  group('Testando a classe Imc - magreza grave', () {
    var valoresMagrezaGrave = {
      {
        'nome': 'Anônimo',
        'peso': 40,
        'altura': 1.65
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza grave!',
      {
        'nome': 'Anônimo',
        'peso': 45,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza grave!',
      {
        'nome': 'Anônimo',
        'peso': 50,
        'altura': 1.77
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza grave!',
    };

    valoresMagrezaGrave.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - magreza moderada', () {
    var valoresMagrezaModerada = {
      {
        'nome': 'Anônimo',
        'peso': 41,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza moderada!',
      {
        'nome': 'Anônimo',
        'peso': 48,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza moderada!',
      {
        'nome': 'Anônimo',
        'peso': 55,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza moderada!',
    };

    valoresMagrezaModerada.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - magreza leve', () {
    var valoresMagrezaLeve = {
      {
        'nome': 'Anônimo',
        'peso': 44,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza leve!',
      {
        'nome': 'Anônimo',
        'peso': 52,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza leve!',
      {
        'nome': 'Anônimo',
        'peso': 59,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado magreza leve!',
    };

    valoresMagrezaLeve.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - saudável', () {
    var valoresSaudavel = {
      {
        'nome': 'Anônimo',
        'peso': 60,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado saudável!',
      {
        'nome': 'Anônimo',
        'peso': 60,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado saudável!',
      {
        'nome': 'Anônimo',
        'peso': 60,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado saudável!',
    };

    valoresSaudavel.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - sobrepeso', () {
    var valoresSobrepeso = {
      {
        'nome': 'Anônimo',
        'peso': 82,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado sobrepeso!',
      {
        'nome': 'Anônimo',
        'peso': 82,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado sobrepeso!',
      {
        'nome': 'Anônimo',
        'peso': 76,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado sobrepeso!',
    };

    valoresSobrepeso.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - obesidade grau 1', () {
    var valoresObesidadeGrau1 = {
      {
        'nome': 'Anônimo',
        'peso': 113,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 1!',
      {
        'nome': 'Anônimo',
        'peso': 100,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 1!',
      {
        'nome': 'Anônimo',
        'peso': 77,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 1!',
    };

    valoresObesidadeGrau1.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - obesidade grau 2 (severa)', () {
    var valoresObesidadeGrau2 = {
      {
        'nome': 'Anônimo',
        'peso': 129,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 2 (severa)!',
      {
        'nome': 'Anônimo',
        'peso': 102,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 2 (severa)!',
      {
        'nome': 'Anônimo',
        'peso': 100,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 2 (severa)!',
    };

    valoresObesidadeGrau2.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });

  group('Testando a classe Imc - obesidade grau 3 (mórbida)', () {
    var valoresObesidadeGrau3 = {
      {
        'nome': 'Anônimo',
        'peso': 131,
        'altura': 1.80
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 3 (mórbida)!',
      {
        'nome': 'Anônimo',
        'peso': 116,
        'altura': 1.70
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 3 (mórbida)!',
      {
        'nome': 'Anônimo',
        'peso': 103,
        'altura': 1.60
      }: 'Atenção Anônimo! De acordo com a tabela de IMC, seu estado é considerado obesidade grau 3 (mórbida)!',
    };

    valoresObesidadeGrau3.forEach((values, expected) {
      Imc imc = Imc(
          values['nome'].toString(),
          double.parse(values['peso'].toString()),
          double.parse(values['altura'].toString()));

      test(
          'Calculando IMC - Nome, Peso e Altura: $values - Resultado esperado: $expected',
          () {
        expect(imc.resultado, equals(expected));
      });
    });
  });
}
