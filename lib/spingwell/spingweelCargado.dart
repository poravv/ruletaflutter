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
  GlobalKey<FormState> _formKey = new GlobalKey();
  String mensaje = "Gire la ruleta";
  String mensajeParticipante = "Gire la ruleta";
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
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Rueda de la Muerte"),
        ),
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  seleccionado == "" ? mensaje : seleccionado,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              Container(
                height: 300,
                child: FortuneWheel(
                  animateFirst: false,
                  selected: selected,
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
                  /*styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.black,
                  color: Colors.red,
                ),*/
                  items: [
                    // ignore: sdk_version_ui_as_code
                    for (var items in item) FortuneItem(child: Text(items))
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
              Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected = Random().nextInt(item.length);
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 40,
                  width: 100,
                  child: Center(
                    child: Text(
                      "SPIN",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
//----------------------------------------------------------------------------------------
              Divider(color: Colors.red,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  seleccionadoParticipante == "" ? mensajeParticipante : seleccionadoParticipante,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              Container(
                height: 300,
                child: FortuneWheel(
                  animateFirst: false,
                  selected: selectedParticipante,
                  physics: CircularPanPhysics(
                    duration: Duration(seconds: 1),
                    curve: Curves.decelerate,
                  ),
                  onFling: () {
                    setState(
                      () {
                        selectedParticipante = Random().nextInt(itemParticipante.length);
                      },
                    );
                  },
                  styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.white,
                  color: Colors.greenAccent,
                ),
                  items: [
                    // ignore: sdk_version_ui_as_code
                    for (var items in itemParticipante) FortuneItem(child: Text(items))
                  ],
                  onAnimationEnd: () {
                    print("Valor: " + selectedParticipante.toString());
                    /*item.forEach((element) {
                      print("Elemento: " + element);
                    });*/
                    setState(() {
                      for (int i = 0; i < itemParticipante.length; i++) {
                        if (selectedParticipante == i) {
                          seleccionadoParticipante = itemParticipante[i];
                          print("Valor: " + itemParticipante[i]);
                          print("Indice: " + i.toString());
                        }
                      }
                    });
                  },
                ),
              ),
              Divider(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedParticipante = Random().nextInt(itemParticipante.length);
                  });
                },
                child: Container(
                  color: Colors.blue,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      "SPIN PARTICIPANTE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
