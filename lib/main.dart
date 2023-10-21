import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'dio_calculadora_imc_flutter.dart';

void main() {
  tz.initializeTimeZones();
  runApp(const DioCalculadoraIMCFlutter());
}
