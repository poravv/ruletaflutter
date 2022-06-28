//@dart=2.9
import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruleta1/cargaprenda.dart';
import 'package:ruleta1/categoria.dart';
import 'package:ruleta1/provider/AppProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider.initialize()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue[600]),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final particleOptions = ParticleOptions(
    image: Image.asset(
        "assets/images/game.png"),
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
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Ruleta"),),
          backgroundColor: Colors.red,
        ),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: particleOptions
          ),
          vsync: this,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categoria()));
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      color: Colors.redAccent,
                      child: Center(
                        child: Text("Jugar Categoria",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CargaPrenda()));
                    },
                    child: Container(
                      height: 40,
                      width: 150,
                      color: Colors.redAccent,
                      child: Center(
                        child: Text("Personalizado",
                            style: TextStyle(color: Colors.white)),
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
