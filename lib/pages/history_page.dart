import 'package:dio_calculadora_imc_flutter/repositories/history_repository.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryRepository historyRepository = HistoryRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF1B1C35),
      appBar: AppBar(
        title: const Text('Histórico'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
                future: historyRepository.retornarHistorico(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Map<String, dynamic>> data = snapshot.data!;
                    List<ListTile> listTiles = data
                        .map(
                          (item) => ListTile(
                            title: Text(
                              '${item['nome']}: ${item['peso'].toString()}Kg e ${item['altura'].toString()}m - ${item['estadoSaude']}',
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                            subtitle: Text(
                              item['data'],
                              style: const TextStyle(color: Color(0xFF8C6147)),
                            ),
                            isThreeLine: true,
                          ),
                        )
                        .toList();
                    return ListView(
                      children: listTiles.reversed.toList(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Erro ao obter dados do banco de dados!');
                  }
                  return const CircularProgressIndicator();
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                historyRepository.deleteAll();
                setState(() {});
              },
              mini: true,
              elevation: 8,
              child: const Icon(Icons.cleaning_services_outlined),
            ),
          )
        ],
      ),
    ));
  }
}
