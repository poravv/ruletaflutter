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
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("RULETA"),),
          backgroundColor: Colors.black,
        ),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: particleOptions
          ),
          vsync: this,
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
                              child: Text("PLAY",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                        Divider(),
                        GestureDetector(
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
                              child: Text("CREAR",
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
      );
  }
}
