import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../themes/theme.dart';
import '../widgets/pageHeader.dart';

class mapPage extends StatefulWidget {
 final GeoPoint loca;
   const mapPage({
     super.key,
   required this.loca
   });

  @override
  State<mapPage> createState() => _mapPageState();
}

class _mapPageState extends State<mapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: lRed,
          ),
        ),
        centerTitle: true,
        title: const pageHeader(title: 'Property Map Location Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(widget.loca.latitude, widget.loca.longitude),zoom: 18),
        markers: {
          Marker(
            markerId: const MarkerId('Property Location'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            position: LatLng(widget.loca.latitude, widget.loca.longitude),
          )
        },
      ),
    );
  }
}
