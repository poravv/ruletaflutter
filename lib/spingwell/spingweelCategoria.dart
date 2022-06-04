//@dart=2.9

import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:ruleta1/model/categoriaModel.dart';
import 'package:ruleta1/provider/AppProvider.dart';

class SpingWellCategoria extends StatefulWidget {
  final CategoriaModel categoriaModel;

  const SpingWellCategoria({Key key, this.categoriaModel}) : super(key: key);
  
  @override
  _SpingWellCategoriaState createState() => _SpingWellCategoriaState();
}

class _SpingWellCategoriaState extends State<SpingWellCategoria> with SingleTickerProviderStateMixin{
  int selected = 0;
  int selectedParticipante = 0;
  String mensaje = "Gire la ruleta";
  String mensajeParticipante = "Gire la ruleta";
  String seleccionado = "";
  String seleccionadoParticipante = "";
  List<String> item = [];
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
    item=widget.categoriaModel.getDetCategoria;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    final List<String> itemParticipante = [];
    for (int i = 0; i < appProvider.lstParticipanteModel.length; i++) {
      itemParticipante.add(appProvider.lstParticipanteModel[i].getparticipante);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(
          child: Text("Rueda"),
        ),
      ),
      //backgroundColor: Colors.white,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(options: particleOptions),
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 500,
              //color: Colors.black,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black,
                child: Text(
                  seleccionado == "" ? mensaje : seleccionado,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selected = Random().nextInt(item.length);
                  });
                },
                child: Container(
                  color: Colors.black,
                  height: 40,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Ruleta Prendas",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
      //----------------------------------------------------------------------------------------
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 500,
                //color: Colors.red,
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
                  /*styleStrategy: UniformStyleStrategy(
                  borderColor: Colors.white,
                  color: Colors.greenAccent,
                  textStyle: TextStyle(fontSize: 14,color: Colors.black)
                ),*/
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
            ),
Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.black,
                child: Text(
                  seleccionadoParticipante == "" ? mensajeParticipante : seleccionadoParticipante,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedParticipante = Random().nextInt(itemParticipante.length);
                  });
                },
                child: Container(
                  color: Colors.black,
                  height: 40,
                  width: 200,
                  child: Center(
                    child: Text(
                      "Ruleta Participantes",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
      )
    );
  }
}
