import 'package:flutter/cupertino.dart';
import 'package:ruleta1/cargaCategoria.dart';
import 'package:ruleta1/model/participantesModel.dart';
import 'package:ruleta1/model/prendasModel.dart';


class AppProvider with ChangeNotifier {
  List<PrendaModel> lstPrendaModel = <PrendaModel>[];
  List<ParticipanteModel> lstParticipanteModel = <ParticipanteModel>[];
  CargaCategoriaService cargaCategoriaService = CargaCategoriaService();

  int idPrendas = 0;
  int idParticipantes = 0;

  AppProvider.initialize() {
    var hoy = new DateTime.now();
    DateTime date = new DateTime(
        hoy.year, hoy.month, hoy.day, hoy.hour, hoy.minute, hoy.second);
    print(date);
    cargaCategoriaService.cargaCategorias();
  }

  void cargaPrendas(String prenda) {
    idPrendas = idPrendas + 1;
    PrendaModel prendaModel =
        PrendaModel.fromString(idPrendas.toString(), prenda);
    lstPrendaModel.add(prendaModel);
  }

  void limpiaPrendas() {
    lstPrendaModel = <PrendaModel>[];
  }

  void cargaParticipantes(String participante) {
    idParticipantes = idParticipantes + 1;
    ParticipanteModel participanteModel =
        ParticipanteModel.fromString(idParticipantes.toString(), participante);
    lstParticipanteModel.add(participanteModel);
  }

  void limpiaParticipantes() {
    lstParticipanteModel = <ParticipanteModel>[];
  }

  removePrendas({String id}) {
    PrendaModel prendaModel;
    for (int i = 0; i < lstPrendaModel.length; i++) {
      if (lstPrendaModel[i].getId == id) {
        prendaModel = lstPrendaModel[i];
      }
    }
    lstPrendaModel.remove(prendaModel);
  }

  removeParticipante({String id}) {
    ParticipanteModel participanteModel;
    for (int i = 0; i < lstParticipanteModel.length; i++) {
      if (lstParticipanteModel[i].getId == id) {
        participanteModel = lstParticipanteModel[i];
      }
    }
    lstParticipanteModel.remove(participanteModel);
  }

  limpiar() {
    limpiaParticipantes();
    limpiaPrendas();
    idPrendas = 0;
    idParticipantes = 0;
  }
}
