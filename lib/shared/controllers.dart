import 'package:flutter/material.dart';

class Controllers {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String getNome() {
    if (nomeController.text == '') {
      return 'Sem nome';
    } else {
      return nomeController.text.trim();
    }
  }

  double? get peso =>
      double.tryParse(pesoController.text.replaceAll(',', '.')) ?? 0;
  double? get altura =>
      double.tryParse(alturaController.text.replaceAll(',', '.')) ?? 0;
}
