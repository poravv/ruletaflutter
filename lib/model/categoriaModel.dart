class CategoriaModel {
//variables privadas
  String _id;
  String _categoria;
  List<String> _detCategoria;

//getters
  String get getId => _id;
  String get getcategoria => _categoria;
  List<String> get getDetCategoria => _detCategoria;

  setId(String id) => _id = id;
  setcategoria(String categoria) => _categoria = categoria;
  setDetCategoria(List<String> detCategoria) =>
      _detCategoria = detCategoria;

  CategoriaModel.fromString(String id, String categoria,List<String> detCategoria) {
    _id = id;
    _categoria = categoria;
    _detCategoria=detCategoria;
  }
}
