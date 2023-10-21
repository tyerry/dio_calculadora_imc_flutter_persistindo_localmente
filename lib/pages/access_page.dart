import 'package:dio_calculadora_imc_flutter/pages/calculator_page.dart';
import 'package:dio_calculadora_imc_flutter/repositories/history_repository.dart';
import 'package:dio_calculadora_imc_flutter/shared/app_images.dart';
import 'package:flutter/material.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  HistoryRepository historyRepository = HistoryRepository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF1B1C35),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                const Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: Image.asset(AppImages.fitaMetrica),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      const Spacer(
                        flex: 1,
                      ),
                      const Text(
                        'Calculadora de IMC',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF66ED6C)),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CalculatorPage()));
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'INICIAR',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF66ED6C)),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
