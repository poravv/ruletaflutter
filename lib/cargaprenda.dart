import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruleta1/provider/AppProvider.dart';
import 'package:ruleta1/spingwell/spingweelCargado.dart';
import 'package:ruleta1/utils/alerta.dart';

class CargaPrenda extends StatefulWidget {
  @override
  _CargaPrendaState createState() => _CargaPrendaState();
}

class _CargaPrendaState extends State<CargaPrenda>
    with SingleTickerProviderStateMixin {
  TextEditingController _prendasController = TextEditingController();
  TextEditingController _participantesController = TextEditingController();
  final particleOptions = ParticleOptions(
    image: Image.network(
        "http://assets.stickpng.com/images/58a1e021e33a543010fac278.png"),
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
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.black,
        title: Text(
          "CREA PRENDA",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(options: particleOptions),
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      title: TextFormField(
                        controller: _prendasController,
                        decoration: InputDecoration(
                            hintText: "Prenda",
                            border: InputBorder.none,
                            icon: Icon(Icons.assignment_ind)),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Debe introducir descripcion";
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    color: Colors.black,
                    textColor: Colors.white,
                    child: Text("Agregar Prenda"),
                    onPressed: () {
                      if (_prendasController.text.isNotEmpty) {
                        bool validacion = true;
                        if (appProvider.lstPrendaModel.length == 0) {
                          setState(() {
                            appProvider.cargaPrendas(_prendasController.text);
                          });
                        } else {
                          for (int i = 0;
                              appProvider.lstPrendaModel.length > i;
                              i++) {
                            if (appProvider.lstPrendaModel[i].getPrenda ==
                                _prendasController.text) {
                              validacion = false;
                            }
                          }

                          if (validacion == true) {
                            setState(() {
                              appProvider.cargaPrendas(_prendasController.text);
                            });
                          } else {
                            mensajeEmergente(
                                "No puedes agregar la misma prenda", context);
                          }
                        }
                        validacion = true;
                        _prendasController.text = "";
                      } else {
                        mensajeEmergente("Cargue el texto", context);
                      }
                    },
                  ),
                ),
              ),
              //Aqui va la lista de prendas
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: appProvider.lstPrendaModel.length != null &&
                        appProvider.lstPrendaModel.length > 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: appProvider.lstPrendaModel.length,
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
                                                    .lstPrendaModel[index]
                                                    .getPrenda
                                                    .toString() ??
                                                "Prenda"),
                                          ),
                                        ),
                                        new Column(
                                          children: [
                                            Container(
                                              //color: Colors.red,
                                              child: IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  setState(() {
                                                    appProvider.removePrendas(
                                                        id: appProvider
                                                            .lstPrendaModel[
                                                                index]
                                                            .getId
                                                            .toString());
                                                    //Navigator.of(context).pop();
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
                              ],
                            ),
                          );
                        })
                    : Center(
                        child: Text("No se han cargado Prendas"),
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
                            hintText: "Participantes",
                            border: InputBorder.none,
                            icon: Icon(Icons.assignment_ind)),
                        // ignore: missing_return
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Debe introducir Participantes";
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Divider(),
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
                    } else {
                      mensajeEmergente("Cargue texto", context);
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
                      )
                    : Center(
                        child: Text("No se ha cargado Participantes"),
                      ),
              ),
              Divider(),
              Center(
                child: Container(
                  height: 100,
                  //width: 300,
                  //color: Colors.white,
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (appProvider.lstPrendaModel.length == 1) {
                                  mensajeEmergente(
                                      "No puedes con una sola prenda", context);
                                } else {
                                  if (appProvider.lstPrendaModel.length != 0) {
                                    if (appProvider
                                            .lstParticipanteModel.length !=
                                        0) {
                                      if (appProvider
                                              .lstParticipanteModel.length ==
                                          1) {
                                        mensajeEmergente(
                                            "No puedes jugar solo", context);
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SpingWeelCargado()));
                                      }
                                    } else {
                                      mensajeEmergente(
                                          "Agregue participantes", context);
                                    }
                                  } else {
                                    mensajeEmergente("Cargue prenda", context);
                                  }
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.red,
                                child: Center(
                                  child: Text("Jugar",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 100,
                    //width: 300,
                    //color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _participantesController =
                                        new TextEditingController();
                                    _prendasController =
                                        new TextEditingController();
                                    appProvider.limpiar();
                                  });
                                  //Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  color: Colors.black,
                                  child: Center(
                                    child: Text("Limpiar",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
