import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci_gps/music.dart';
import 'package:hci_gps/settings.dart';

import 'clock.dart';
import 'navigation.dart';

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
  PageController _controller;
  double currentPage = 0;
  Widget _selectedPage;

  void initState() {
    super.initState();

    _controller = PageController()
      ..addListener(() {
        setState(() {
          currentPage = _controller.page;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Clock(),
        leading: _selectedPage != null
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedPage = null;
                  });
                },
              )
            : null,
        centerTitle: true,
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _selectedPage == null ? _buildBody() : _selectedPage,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            SlideTransition(
          child: child,
          position: Tween<Offset>(
            begin: const Offset(0, 2),
            end: Offset.zero,
          ).animate(animation),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 600),
            child: PageView(
              controller: _controller,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildButton("Navigation", Icons.navigation, MapMenu(),
                            Colors.purple[600]),
                        _buildButton("Music", Icons.library_music, MusicMenu(),
                            Colors.blue[600]),
                        _buildButton("Podcasts", Icons.audiotrack, null,
                            Colors.indigo[600]),
                        _buildButton(
                            "Radio", Icons.radio, null, Colors.green[600])
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildButton(
                            "Phone", Icons.phone, null, Colors.cyan[600]),
                        _buildButton(
                            "Messages", Icons.message, null, Colors.red[600]),
                        _buildButton("Equalizer", Icons.equalizer, null,
                            Colors.amber[600]),
                        _buildButton(
                            "Settings", Icons.settings, null, Colors.grey[600])
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildButton("TODO", Icons.work, MapMenu(),
                            Colors.blueGrey[900]),
                        _buildButton("TODO", Icons.work, MusicMenu(),
                            Colors.blueGrey[900]),
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900]),
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900])
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900]),
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900]),
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900]),
                        _buildButton(
                            "TODO", Icons.work, null, Colors.blueGrey[900])
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          _buildDots()
        ],
      ),
    );
  }

  Widget _buildButton(String title, IconData icon, Widget screen, Color color) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: <Widget>[
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(90),
            child: InkWell(
              onTap: () {
                setState(() {
                  _selectedPage = screen;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Icon(icon, size: 80, color: color),
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
    List<Widget> dots = [];
    for (int i = 0; i < 2; i++) {
      dots.add(
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 20,
              width: 20,
              child: Material(
                color:
                    currentPage.round() == i ? Colors.white : Colors.grey[500],
                borderRadius: BorderRadius.circular(20),
              )),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }
}
