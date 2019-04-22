import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Completer<GoogleMapController> _controller = Completer();
    final CameraPosition _kmitl = CameraPosition(
      target: LatLng(13.7265887, 100.774959),
      zoom: 15
    );
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kmitl,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      )
    );
  }
  
}