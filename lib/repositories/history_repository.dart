import 'package:dio_calculadora_imc_flutter/model/history_model.dart';
import 'package:dio_calculadora_imc_flutter/repositories/sqlite/sqlite_database.dart';
import 'package:flutter/material.dart';

class HistoryRepository extends ChangeNotifier {
  Future<List<HistoryModel>> obterDados() async {
    List<HistoryModel> historyModel = [];
    var db = await SqliteDatabase().obterDatabase();
    var result = await db.rawQuery(
        'SELECT id, nome, peso, altura, estadoSaude, data FROM historico');
    for (var element in result) {
      historyModel.add(HistoryModel(
          int.parse(element['id'].toString()),
          element['nome'].toString(),
          double.parse(element['peso'].toString()),
          double.parse(element['altura'].toString()),
          element['estadoSaude'].toString(),
          element['data'].toString()));
    }
    return historyModel;
  }

  Future<List<Map<String, dynamic>>> retornarHistorico() async {
    var db = await SqliteDatabase().obterDatabase();
    final List<Map<String, dynamic>> dados = await db.query('historico');
    return dados;
  }

  Future<void> insert(HistoryModel historyModel) async {
    var db = await SqliteDatabase().obterDatabase();
    await db.rawInsert(
        'INSERT INTO historico (nome, peso, altura, estadoSaude, data) values (?,?,?,?,?)',
        [
          historyModel.nome,
          historyModel.peso,
          historyModel.altura,
          historyModel.estadoSaude,
          historyModel.data
        ]);
  }

  Future<void> update(HistoryModel historyModel) async {
    var db = await SqliteDatabase().obterDatabase();
    await db.rawUpdate(
        'UPDATE historico SET nome = ?, peso = ?, altura = ?, estadoSaude = ?, data = ? WHERE id = ?',
        [
          historyModel.nome,
          historyModel.peso,
          historyModel.altura,
          historyModel.estadoSaude,
          historyModel.data,
          historyModel.id
        ]);
  }

  Future<void> delete(int id) async {
    var db = await SqliteDatabase().obterDatabase();
    await db.rawDelete('DELETE FROM historico WHERE id = ?', [id]);
  }

  Future<void> deleteAll() async {
    var db = await SqliteDatabase().obterDatabase();
    await db.rawDelete('DELETE FROM historico');
  }
}
