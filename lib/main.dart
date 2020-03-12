import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci_gps/music.dart';

import 'clock.dart';
import 'floatin_search_bar.dart';
import 'maps.dart';
import 'menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HCI Team 13 GPS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Clock(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton("Maps", Icons.location_on, MapMenu()),
                  _buildButton("Music", Icons.library_music, MusicMenu()),
                  _buildButton("Radio", Icons.radio, null)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildButton("", Icons.warning, null),
                  _buildButton("", Icons.warning, null),
                  _buildButton("", Icons.warning, null)
                ],
              ),
              _buildDots()
            ],
          ),
        ));
  }

  Widget _buildButton(String title, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(90),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => screen));
              },
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Icon(icon, size: 50, color: Colors.blueGrey[900]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(title,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white, fontSize: 24))),
          )
        ],
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              height: 4,
              width: 4,
              child: Material(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(4),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              height: 4,
              width: 4,
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              height: 4,
              width: 4,
              child: Material(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(4),
              )),
        )
      ],
    );
  }
}
