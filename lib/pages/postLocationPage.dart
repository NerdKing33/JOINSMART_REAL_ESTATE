import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class postLocationPage extends StatefulWidget {
  final Map<dynamic, dynamic> postData;

  const postLocationPage({super.key, required this.postData});

  @override
  State<postLocationPage> createState() => _postLocationPageState();
}

class _postLocationPageState extends State<postLocationPage> {
  late GoogleMapController googleMapController;
  static CameraPosition initialPostion =
  const CameraPosition(target: LatLng(-6.3690, 34.8888), zoom: 5.5);
  Set<Marker> marker = {};

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Service are disabled');
    }
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location Permission Denied');
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permission are Denied Permanently change Settings');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                splashColor: Colors.greenAccent,
                icon: const Icon(
                  color: Colors.white,
                  Icons.arrow_circle_left_outlined,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        body: GoogleMap(
          initialCameraPosition: initialPostion,
          markers: marker,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            googleMapController = controller;
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.red.shade900,
          splashColor: Colors.greenAccent,
          onPressed: () async {
            Position position = await _determinePosition();
            googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(widget.postData['geoPoint'].latitude,
                        widget.postData['geoPoint'].longitude),
                    zoom: 13)));
            marker.clear();
            marker.add(Marker(
              markerId: const MarkerId('Post Location'),
              position: LatLng(widget.postData['geoPoint'].latitude,
                  widget.postData['geoPoint'].longitude),
            ));
            setState(() {});
          },
          label: Text(
            'Go to Post\'s Location',
            style: GoogleFonts.galdeano(color: Colors.white),
          ),
          icon: const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
          ),
        ));
  }
}
