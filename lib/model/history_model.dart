class HistoryModel {
  int _id = 0;
  String _nome = '';
  double _peso = 0;
  double _altura = 0;
  String _estadoSaude = '';
  String _data = '';

  HistoryModel(this._id, this._nome, this._peso, this._altura,
      this._estadoSaude, this._data);

  int get id => _id;
  String get nome => _nome;
  double get peso => _peso;
  double get altura => _altura;
  String get estadoSaude => _estadoSaude;
  String get data => _data;

  set id(int id) {
    _id = id;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  set estadoSaude(String estadoSaude) {
    _estadoSaude = estadoSaude;
  }

  set data(String data) {
    _data = data;
  }
}
