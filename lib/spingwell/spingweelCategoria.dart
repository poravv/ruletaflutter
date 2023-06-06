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

class _SpingWellCategoriaState extends State<SpingWellCategoria>
    with SingleTickerProviderStateMixin {
  int selected = 0;
  int selectedParticipante = 0;
  String mensaje = "Gire la ruleta";
  String mensajeParticipante = "Gire la barra";
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
    item = widget.categoriaModel.getDetCategoria;
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
          title: Text("Por Categoría"),
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
                    indicators: <FortuneIndicator>[
                      FortuneIndicator(
                        alignment: Alignment.topCenter, // <-- changing the position of the indicator
                        child: TriangleIndicator(
                          color: Colors.deepPurpleAccent, // <-- changing the color of the indicator
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
                    items: [
                      // ignore: sdk_version_ui_as_code
                      for (var items in item)
                        FortuneItem(
                          child: Text(items),
                          style: FortuneItemStyle(
                              color: Colors
                                  .black, // <-- custom circle slice fill color
                              borderColor: Colors
                                  .white, // <-- custom circle slice stroke color
                              borderWidth:
                                  1, // <-- custom circle slice stroke width
                              textStyle: TextStyle(fontSize: 10)
                              ),
                        )
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
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    //color: Colors.black,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2.0, color: Colors.black)),
                    child: Text(
                      seleccionado == "" ? mensaje : seleccionado,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
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

                      items: [
                        // ignore: sdk_version_ui_as_code
                        for (var items in itemParticipante)
                          FortuneItem(
                            child: Text(
                              items,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      ],
                      onAnimationEnd: () {
                        //print("Valor: " + selectedParticipante.toString());
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
                        fontSize: 19,
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
          ),
        ));
  }
}
