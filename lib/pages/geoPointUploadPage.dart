import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/themes/theme.dart';


class geoPointUploadPage extends StatefulWidget {
  const geoPointUploadPage({super.key});

  @override
  State<geoPointUploadPage> createState() => _geoPointUploadPageState();
}

class _geoPointUploadPageState extends State<geoPointUploadPage> {
  // Location locationController = Location();
  // LatLng? _userLocation;
  late GoogleMapController googleMapController;
  CameraPosition? initialPosition;
  Set<Marker> marker = {};
  late GeoPoint loca;
  bool instructionClosed = false;
  bool locationSet = false;
  @override
  void initState(){
    super.initState();
    _determinePosition();
    clientLocations();
  }
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
    setState(() {
      initialPosition = CameraPosition(
          target: LatLng(position.latitude, position.longitude), zoom: 20);
    });
    return position;
  }
  clientLocations() async {
    Position position = await _determinePosition();
    marker.clear();
    marker.add(
        Marker(
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        visible: true,
        zIndex: 5,
        markerId: const MarkerId('Your Location'),
        draggable: true,
        position: LatLng(position.latitude, position.longitude),
        onDragEnd: (loc) {
          setState(() {
            locationSet = true;
            loca = GeoPoint(loc.latitude, loc.longitude);
          });
        }));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child:  initialPosition == null
                ?Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            strokeWidth: 5,
            color: Colors.green.shade200,
          ),
        ),
      )
              : Stack(
            children: [
                  GoogleMap(
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                    },
                    initialCameraPosition: initialPosition!,
                    zoomControlsEnabled: false,
                    markers: marker,
                  ),
                  instructionClosed? sb0: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 500,
                      height: 300,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: basicShadow
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Map Location Setting Instructions:\n',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    color: lRed,
                                    letterSpacing: 1.5,
                                    wordSpacing: 2
                                  )
                                ),
                                TextSpan(
                                  text: ' Tap and Drag the Red Pin on Your Location on the Map at the Center Of The Screen Behind this Instructions Banner and Move to the Position of The Property a option to continue will appear to the Bottom Right of your Screen when completed correctly ',
                                  style: GoogleFonts.rajdhani(
                                    fontSize: 20,
                                    color: Colors.black,
                                  )
                                )
                              ]
                            ),
                          ),
                          sbH10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: lRed,
                                  borderRadius: BorderRadius.circular(10.0)
                                ),
                                child: TextButton(onPressed: (){
                                  setState(() {
                                    instructionClosed = true;
                                  });
                                }, child: Text(
                                  'CLOSE',
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  locationSet ? Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: lRed,
                            width: .5,
                          )
                        ),
                        child: TextButton(onPressed: (){
                          setState(() {
                            instructionClosed = true;
                          });
                        }, child: Text(
                          'Finish Property Post',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: lRed
                          ),
                        )),
                      ),
                    ),
                  ):sb0,
                ],
              )
        ),
      ),
    );
  }
}
