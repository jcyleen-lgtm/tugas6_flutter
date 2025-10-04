import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'pertama.dart';
import 'kedua.dart';
import 'ketiga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('Contoh Button Navigation')),
        body: Layar(),
      ),
    );
  }
}

class Layar extends StatefulWidget {
  const Layar({super.key});

  @override
  State<Layar> createState() => _LayarState();
}

class _LayarState extends State<Layar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: TextButton(
                child: Text("Input"),
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Pertama())),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: OutlinedButton(
                child: Text("Process"),
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Kedua())),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: IconButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Ketiga())),
                icon: Icon(Icons.output),
              ),
            ),
          ],
        ),
      ),
    );
  }
}