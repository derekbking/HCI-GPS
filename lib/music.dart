import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicMenu extends StatefulWidget {
  MusicMenu({Key key}) : super(key: key);

  @override
  _MusicMenuState createState() => _MusicMenuState();
}

class _MusicMenuState extends State<MusicMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildSongInfo(),
                _buildSongName(),
                _buildControls()
              ],
            ),
          ),
        ));
  }

  Widget _buildControls() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
              ),
              color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.fast_rewind),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
              ),
              color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.pause),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
              ),
              color: Colors.grey[300]),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Icon(Icons.fast_forward),
          ),
        ),
      ],
    );
  }

  Widget _buildSongInfo() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Now Playing",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.grey[300], fontSize: 18))),
        ),
        _buildAlbumCover(),
        _buildProgressIndicator()
      ],
    );
  }

  Widget _buildSongName() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Sky Walker",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 26))),
        ),
        Text("Miguel, Travis Scott",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.grey[300], fontSize: 18)))
      ],
    );
  }

  Widget _buildAlbumCover() {
    return Image.asset("assets/album.jpg");
  }

  Widget _buildProgressIndicator() {
    return SizedBox(
      height: 6.0,
      child: LinearProgressIndicator(
        value: 0.3,
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(0xFF7D9AFF),
        ),
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
