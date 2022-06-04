import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruleta1/cargaCategoria.dart';
import 'package:ruleta1/model/categoriaModel.dart';
import 'package:ruleta1/provider/AppProvider.dart';
import 'package:ruleta1/spingwell/spingweelCategoria.dart';
import 'package:ruleta1/utils/alerta.dart';

class Categoria extends StatefulWidget {
  @override
  _CategoriaState createState() => _CategoriaState();
}

class _CategoriaState extends State<Categoria>
    with SingleTickerProviderStateMixin {
  TextEditingController _participantesController = TextEditingController();
  List<DropdownMenuItem<CategoriaModel>> _dropDownMenuItemsCategoria;
  CargaCategoriaService cargaCategoriaService = CargaCategoriaService();
  CategoriaModel _currentCategoria;
  final particleOptions = ParticleOptions(
    image: Image.asset("assets/images/fuego.png"),
    baseColor: Colors.red,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    spawnMinSpeed: 20.0,
    spawnMaxSpeed: 70.0,
    spawnMinRadius: 20.0,
    spawnMaxRadius: 30.0,
    particleCount: 30,
  );

  @override
  void initState() {
    cargaCategoriaService.cargaCategorias();
    _dropDownMenuItemsCategoria = getDropDownMenuItems();
    _currentCategoria = _dropDownMenuItemsCategoria[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.red,
        title: Center(
          child: Text(
            "Por categoria",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(options: particleOptions),
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new DropdownButtonFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: _currentCategoria,
                  items: _dropDownMenuItemsCategoria,
                  onChanged: changedDropDownItemCategoria,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _participantesController,
                        decoration: InputDecoration(
                            hintText: "Participante",
                            border: InputBorder.none,
                            icon: Icon(Icons.assignment_ind)),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Debe introducir Participante";
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Text("Agregar Participante"),
                  onPressed: () {
                    if (_participantesController.text.isNotEmpty) {
                      bool validacion = true;
                      if (appProvider.lstParticipanteModel.length == 0) {
                        setState(() {
                          appProvider.cargaParticipantes(
                              _participantesController.text);
                        });
                        validacion = false;
                      } else {
                        for (int i = 0;
                            appProvider.lstParticipanteModel.length > i;
                            i++) {
                          if (appProvider
                                  .lstParticipanteModel[i].getparticipante ==
                              _participantesController.text) {
                            validacion = false;
                          }
                        }
                        if (validacion == true) {
                          setState(() {
                            appProvider.cargaParticipantes(
                                _participantesController.text);
                          });
                        } else {
                          mensajeEmergente(
                              "No puedes agregar al mismo participante",
                              context);
                        }
                      }

                      validacion = true;
                      _participantesController = TextEditingController();
                    } else {
                      mensajeEmergente("Carga texto", context);
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: appProvider.lstParticipanteModel.length != null &&
                        appProvider.lstParticipanteModel.length > 0
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(border: Border.all(
                            color: Colors.grey,
                            width: 1
                          ),
                          borderRadius: BorderRadius.horizontal()),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: appProvider.lstParticipanteModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          new Row(
                                            children: [
                                              Container(
                                                // width: 100,
                                                //color: Colors.amber,
                                                child: Padding(
                                                  padding: EdgeInsets.all(15),
                                                  child: new Text(appProvider
                                                          .lstParticipanteModel[
                                                              index]
                                                          .getparticipante
                                                          .toString() ??
                                                      "Participante"),
                                                ),
                                              ),
                                            ],
                                          ),
                                          new Column(
                                            children: [
                                              Container(
                                                //color: Colors.red,
                                                child: IconButton(
                                                  icon: Icon(Icons.delete),
                                                  onPressed: () {
                                                    setState(() {
                                                      appProvider.removeParticipante(
                                                        id: appProvider
                                                            .lstParticipanteModel[
                                                                index]
                                                            .getId
                                                            .toString());
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    : Center(
                        child: Text("No se ha cargado Participantes"),
                      ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("             Jugar             "),
                  onPressed: () {
                    if (_currentCategoria != null) {
                      if (appProvider.lstParticipanteModel.length != 0) {
                        if (appProvider.lstParticipanteModel.length == 1) {
                          mensajeEmergente("No puedes jugar solo", context);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SpingWellCategoria(
                                        categoriaModel: _currentCategoria,
                                      )));
                        }
                      } else {
                        mensajeEmergente("Agregue participantes", context);
                      }
                    } else {
                      mensajeEmergente("Seleccione categoria", context);
                    }
                  },
                ),
              ),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: Text("           Limpiar           "),
                  onPressed: () {
                    setState(() {
                      _participantesController = new TextEditingController();
                      appProvider.limpiar();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<CategoriaModel>> getDropDownMenuItems() {
    List<DropdownMenuItem<CategoriaModel>> items = [];

    items.add(new DropdownMenuItem(
        value: null, child: new Text("--Seleccione categoria--")));

    for (CategoriaModel categorias in cargaCategoriaService.lstCategoria) {
      items.add(new DropdownMenuItem(
          value: categorias,
          child: new Text(categorias.getcategoria.toString())));
    }
    return items;
  }

  void changedDropDownItemCategoria(CategoriaModel selectedCategoria) {
    print("Selected categoria $selectedCategoria");
    setState(() {
      _currentCategoria = selectedCategoria;
    });
  }
}
