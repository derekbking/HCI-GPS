import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci_gps/maps.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Select a Destination",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 60))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text("or",
                        style: GoogleFonts.montserrat(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w100))),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightForFinite(width: 200),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Icon(Icons.search),
                            ),
                            hintText: "Search"),
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildButton(Icons.restaurant),
                  buildButton(Icons.local_gas_station),
                  buildButton(Icons.local_hospital)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildButton(Icons.local_hotel),
                  buildButton(Icons.local_movies),
                  buildButton(Icons.local_parking)
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(90),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GoogleMap()));
          },
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Icon(icon, size: 40, color: Colors.blueGrey[900]),
          ),
        ),
      ),
    );
  }
}
