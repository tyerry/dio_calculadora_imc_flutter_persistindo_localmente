import 'package:timezone/timezone.dart';

class FormattedDate {
  TZDateTime dataDeHoje = TZDateTime.now(getLocation('America/Sao_Paulo'));

  late int dia = dataDeHoje.day;
  late int mes = dataDeHoje.month;
  late int ano = dataDeHoje.year;

  late String dataFormatada = '$dia/$mes/$ano';
}
