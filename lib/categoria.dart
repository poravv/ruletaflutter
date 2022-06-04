
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

class _CategoriaState extends State<Categoria> with SingleTickerProviderStateMixin{
  TextEditingController _participantesController = TextEditingController();
  List<DropdownMenuItem<CategoriaModel>> _dropDownMenuItemsCategoria;
  CargaCategoriaService cargaCategoriaService = CargaCategoriaService();
  CategoriaModel _currentCategoria;
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
        backgroundColor: Colors.black,
        title: Text("POR CATEGORIA",style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: particleOptions
          ),
          vsync: this,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new DropdownButton(
                value: _currentCategoria,
                items: _dropDownMenuItemsCategoria,
                onChanged: changedDropDownItemCategoria,
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
              LstParticipantes(context),
              Divider(),
              Container(
                // ignore: deprecated_member_use
                child: FlatButton(
                  color: Colors.orange,
                  textColor: Colors.white,
                  child: Text("Agregar Participante"),
                  onPressed: () {
                    bool validacion=true;
                    if (appProvider.lstParticipanteModel.length == 0) {
                      setState(() {
                        appProvider
                            .cargaParticipantes(_participantesController.text);
                      });
                    }
      
                    for (int i = 0;
                        appProvider.lstParticipanteModel.length > i;
                        i++) {
                          if(appProvider.lstParticipanteModel[i].getparticipante==_participantesController.text){
                          validacion=false;  
                          }
                    }
      
                    if (validacion==true) {
                        setState(() {
                          appProvider
                              .cargaParticipantes(_participantesController.text);
                        });
                      } else {
                        mensajeEmergente("No puedes agregar al mismo participante", context);
                      }
                      validacion=true;
                  },
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
                                if (_currentCategoria != null) {
                                  if (appProvider.lstParticipanteModel.length !=
                                      0) {
                                    if (appProvider.lstParticipanteModel.length ==
                                        1) {
                                      mensajeEmergente("No puedes jugar solo", context);
                                      
                                    } else {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SpingWellCategoria(
                                                    categoriaModel:
                                                        _currentCategoria,
                                                  )));
                                    }
                                  } else {
                                    mensajeEmergente("Agregue participantes", context);
                                  }
                                } else {
                                      mensajeEmergente("Seleccione categoria", context);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.blue,
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
                                setState(() {
                                  _participantesController =
                                      new TextEditingController();
                                  appProvider.limpiar();
                                });
                                //Navigator.pop(context);
                              },
                              child: Container(
                                height: 40,
                                width: 150,
                                color: Colors.red,
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
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<CategoriaModel>> getDropDownMenuItems() {
    List<DropdownMenuItem<CategoriaModel>> items = [];
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

// ignore: non_constant_identifier_names
Widget LstParticipantes(context) {
  var appProvider = Provider.of<AppProvider>(context);
  if (appProvider.lstParticipanteModel.length != null &&
      appProvider.lstParticipanteModel.length > 0) {
    return Container(
      //height: 50,
      width: 200,
      color: Colors.yellow,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: appProvider.lstParticipanteModel.length,
          itemBuilder: (BuildContext context, int index) {
            return LstParticipantesIndividuales(
              id: appProvider.lstParticipanteModel[index].getId,
              participante:
                  appProvider.lstParticipanteModel[index].getparticipante,
            );
          }),
    );
  } else {
    return Center(
      child: Text("No se ha cargado Participantes"),
    );
  }
}

class LstParticipantesIndividuales extends StatelessWidget {
  final id;
  final participante;

  LstParticipantesIndividuales({
    this.id,
    this.participante,
  });

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Row(
                children: [
                  Container(
                    // width: 100,
                    //color: Colors.amber,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: new Text(
                          this.participante.toString() ?? "Participante"),
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
                        appProvider.removeParticipante(id: this.id.toString());
                        Navigator.of(context).pop();
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
  }
}
