import 'package:dio_calculadora_imc_flutter/pages/history_page.dart';
import 'package:dio_calculadora_imc_flutter/repositories/history_repository.dart';
import 'package:dio_calculadora_imc_flutter/shared/controllers.dart';
import 'package:dio_calculadora_imc_flutter/shared/formatted_date.dart';
import 'package:dio_calculadora_imc_flutter/shared/imc.dart';
import 'package:dio_calculadora_imc_flutter/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:dio_calculadora_imc_flutter/model/history_model.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Controllers controllers = Controllers();
  FormattedDate formattedDate = FormattedDate();
  bool isCardVisible = false;
  HistoryRepository historyRepository = HistoryRepository();
  var _history = <HistoryModel>[];

  @override
  void initState() {
    super.initState();
    obterHistorico();
  }

  void obterHistorico() async {
    _history = await historyRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Imc imc = Imc(
        controllers.getNome(), controllers.peso ?? 0, controllers.altura ?? 0);

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1C35),
        appBar: AppBar(title: const Text('Digite seus dados')),
        body: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  label: 'Seu nome',
                  hint: 'Ex.: Maria',
                  controller: controllers.nomeController,
                  textType: TextInputType.name,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  label: 'Seu peso (Kg)',
                  hint: 'Ex.: 50',
                  controller: controllers.pesoController,
                  textType: TextInputType.number,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: CustomTextField(
                  label: 'Sua altura (m)',
                  hint: 'Ex.: 1.60',
                  controller: controllers.alturaController,
                  textType: TextInputType.number,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 150,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                    isCardVisible = true;
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: const Text(
                  'CALCULAR',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF66ED6C)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            if (isCardVisible)
              Card(
                margin: const EdgeInsets.all(40),
                elevation: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    imc.resultado,
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 190,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    historyRepository.insert(HistoryModel(
                      0,
                      controllers.getNome(),
                      controllers.peso ?? 0,
                      controllers.altura ?? 0,
                      imc.estadoSaude,
                      formattedDate.dataFormatada,
                    ));
                    obterHistorico();
                    historyRepository.retornarHistorico();
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF8C6147)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: const Text(
                  'Adicionar ao Histórico',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF66ED6C)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: 190,
              height: 30,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF8C6147)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                child: const Text(
                  'Visualizar Histórico',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF66ED6C)),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
