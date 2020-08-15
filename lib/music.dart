import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'clock.dart';

class MusicMenu extends StatefulWidget {
  MusicMenu({Key key}) : super(key: key);

  @override
  _MusicMenuState createState() => _MusicMenuState();
}

class _MusicMenuState extends State<MusicMenu> {
  double value = 30;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildSongName(),
                SizedBox(
                  height: 20,
                ),
                _buildAlbumCover(),
                _buildProgressIndicator(),
                _buildControls()
              ],
            ),
          ),
          SizedBox(width: 100),
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 400, height: 625),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Songs",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 26))),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 575),
                  child: ListView(
                    children: <Widget>[
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                      _buildSong(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSong() {
    return Card(
      child: ListTile(
        onTap: () {},
        contentPadding: EdgeInsets.all(8.0),
        leading: Material(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset("assets/album.jpg")),
        title: Text("Heartless", style: TextStyle(fontSize: 32.0)),
        subtitle:
            Text("Miguel, Travis Scott", style: TextStyle(fontSize: 20.0)),
        trailing: Icon(Icons.play_arrow),
      ),
    );
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
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Icon(
              Icons.fast_rewind,
              size: 30,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Icon(
              Icons.pause,
              size: 30,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
              ),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Icon(
              Icons.fast_forward,
              size: 30,
            ),
          ),
        ),
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
    return Slider(
      min: 0,
      max: 160,
      value: value,
      onChanged: (v) => setState(
        () {
          this.value = v;
        },
      ),
    );
  }
}
