

class ParticipanteModel {

//variables privadas
  String _id;
  String _participante;

//getters
String get getId => _id;
  String get getparticipante => _participante;
  setparticipante(String participante) => _participante=participante;
  setId(String id) => _id=id;

  ParticipanteModel.fromString(String id,String participante) {
    _id=id;
  _participante=participante;
  }

}
