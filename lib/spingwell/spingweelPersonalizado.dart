//@dart=2.9
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:ruleta1/provider/AppProvider.dart';

class SpingWeelCargado extends StatefulWidget {
  @override
  _SpingWeelCargadoState createState() => _SpingWeelCargadoState();
}

class _SpingWeelCargadoState extends State<SpingWeelCargado> {
  int selected = 0;
  int selectedParticipante = 0;
  String mensaje = "Gire la ruleta";
  String mensajeParticipante = "Gire la barra";
  String seleccionado = "";
  String seleccionadoParticipante = "";

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    final List<String> item = [];
    final List<String> itemParticipante = [];

    for (int i = 0; i < appProvider.lstPrendaModel.length; i++) {
      item.add(appProvider.lstPrendaModel[i].getPrenda);
    }

    for (int i = 0; i < appProvider.lstParticipanteModel.length; i++) {
      itemParticipante.add(appProvider.lstParticipanteModel[i].getparticipante);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Personalizada"),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  child: FortuneWheel(
                    animateFirst: false,
                    selected: selected,
                    indicators: <FortuneIndicator>[
                      FortuneIndicator(
                        alignment: Alignment
                            .topCenter, // <-- changing the position of the indicator
                        child: TriangleIndicator(
                          color: Colors
                              .deepPurpleAccent, // <-- changing the color of the indicator
                        ),
                      ),
                    ],
                    physics: CircularPanPhysics(
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                    ),
                    onFling: () {
                      setState(
                        () {
                          selected = Random().nextInt(item.length);
                        },
                      );
                    },
                    //styleStrategy: UniformStyleStrategy(borderColor: Colors.white,color: Colors.black,borderWidth: 1),
                    /*styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.black,
                  color: Colors.red,
                ),*/
                    items: [
                      // ignore: sdk_version_ui_as_code
                      for (var items in item)
                        FortuneItem(
                            style: FortuneItemStyle(
                                color: Colors
                                    .black, // <-- custom circle slice fill color
                                borderColor: Colors
                                    .white, // <-- custom circle slice stroke color
                                borderWidth:
                                    1, // <-- custom circle slice stroke width
                                textStyle: TextStyle(fontSize: 10)),
                            child: Text(
                              items,
                              style: TextStyle(color: Colors.white),
                            ))
                    ],
                    onAnimationEnd: () {
                      print("Valor: " + selected.toString());
                      /*item.forEach((element) {
                      print("Elemento: " + element);
                    });*/
                      setState(() {
                        for (int i = 0; i < item.length; i++) {
                          if (selected == i) {
                            seleccionado = item[i];
                            print("Valor: " + item[i]);
                            print("Indice: " + i.toString());
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.black,
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(3.0),
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black)),
                  child: Text(
                    seleccionado == "" ? mensaje : seleccionado,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          selected = Random().nextInt(item.length);
                        });
                      },
                      child: Text(
                        'Girar Ruleta',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //height: 400,
                  child: FortuneBar(
                    animateFirst: false,
                    selected: selectedParticipante,
                    indicators: <FortuneIndicator>[
                      FortuneIndicator(
                        alignment: Alignment.topCenter,
                        child: RectangleIndicator(
                          borderColor: Colors.deepPurpleAccent,
                        ),
                      ),
                    ],
                    physics: CircularPanPhysics(
                      duration: Duration(seconds: 1),
                      curve: Curves.decelerate,
                    ),
                    onFling: () {
                      setState(
                        () {
                          selectedParticipante =
                              Random().nextInt(itemParticipante.length);
                        },
                      );
                    },
                    //styleStrategy: AlternatingStyleStrategy(),
                    styleStrategy: UniformStyleStrategy(
                        color:
                            Colors.black, // <-- custom circle slice fill color
                        borderColor: Colors
                            .white, // <-- custom circle slice stroke color
                        borderWidth: 2,
                        textAlign: TextAlign.end,
                      ),
                    duration: Duration(seconds: 7),
                    items: [
                      // ignore: sdk_version_ui_as_code
                      for (var items in itemParticipante)
                        FortuneItem(
                            child: Text(
                          items,
                          style: TextStyle(color: Colors.white),
                        ))
                    ],
                    onAnimationEnd: () {
                      //print("Valor: " + selectedParticipante.toString());
                      /*item.forEach((element) {
                      print("Elemento: " + element);
                    });*/
                      setState(() {
                        for (int i = 0; i < itemParticipante.length; i++) {
                          if (selectedParticipante == i) {
                            seleccionadoParticipante = itemParticipante[i];
                            //print("Valor: " + itemParticipante[i]);
                            //print("Indice: " + i.toString());
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  //color: Colors.black,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black)),
                  child: Text(
                    seleccionadoParticipante == ""
                        ? mensajeParticipante
                        : seleccionadoParticipante,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedParticipante =
                              Random().nextInt(itemParticipante.length);
                        });
                      },
                      child: Text(
                        'Barra de Participantes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    )),
            ],
          ),
        ],
      ),
    );
  }
}
