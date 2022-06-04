

class PrendaModel {

//variables privadas
  String _id;
  String _prenda;

//getters
  String get getId => _id;
  String get getPrenda => _prenda;
  setPrenda(String prenda) => _prenda=prenda;
  setId(String id) => _id=id;

  PrendaModel.fromString(String id,String prenda) {
  _id=id;
  _prenda=prenda;
  }

}
