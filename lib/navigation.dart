import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hci_gps/maps.dart';

class MapMenu extends StatefulWidget {
  MapMenu({Key key}) : super(key: key);

  @override
  _MapMenuState createState() => _MapMenuState();
}

class _MapMenuState extends State<MapMenu> {
  bool displayMap = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: displayMap ? GoogleMap() : _buildMenu(),
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
    );
  }

  Widget _buildMenu() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("Navigation",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 40),
                  color: Colors.white,
                  fontWeight: FontWeight.w200)),
          SizedBox(height: 35),
          Material(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            child: ConstrainedBox(
              constraints: BoxConstraints.tightForFinite(width: 550),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.search,
                        size: 26,
                      ),
                    ),
                    hintText: "Search a destination"),
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(fontSize: 26),
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton("Restaurants", Icons.restaurant, Colors.purple[600]),
              _buildButton("Gas", Icons.local_gas_station, Colors.blue[600]),
              _buildButton("Hospital", Icons.local_hospital, Colors.indigo[600])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton("Hotels", Icons.hotel, Colors.cyan[600]),
              _buildButton("Movies", Icons.movie, Colors.red[600]),
              _buildButton("Parking", Icons.local_parking, Colors.amber[600])
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String title, IconData icon, Color color) {
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
                  displayMap = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Icon(icon, size: 50, color: color),
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
}
