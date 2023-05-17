// ignore_for_file: prefer_collection_literals, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Posizione extends StatefulWidget {
  const Posizione({super.key});

  @override
  State<Posizione> createState() => _PosizioneState();
}

class _PosizioneState extends State<Posizione> {
  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(37.7749, -122.4194), // Coordinate del marcatore
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
            size: 40.0,
          ),
        ),
      ),
      Marker(
        width: 40.0,
        height: 40.0,
        point: LatLng(37.7897, -122.4155), // Coordinate del marcatore
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.blue,
            size: 40.0,
          ),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Mappa'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center:
              LatLng(37.7749, -122.4194), // Coordinate del centro della mappa
          zoom: 12.0,
        ),
      ),
    );
  }
}
