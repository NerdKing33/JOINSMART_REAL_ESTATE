import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/resources/auth.dart';
import 'package:housing_information_website/widgets/detailsDropdown/paymentPeriod.dart';
import 'package:housing_information_website/widgets/detailsDropdown/propertyTypeDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../themes/theme.dart';
import '../resources/utils.dart';
import '../widgets/detailsDropdown/areaDetails.dart';
import '../widgets/detailsDropdown/bathroomsDetails.dart';
import '../widgets/detailsDropdown/floorDetails.dart';
import '../widgets/detailsDropdown/locationCityDetails.dart';
import '../widgets/detailsDropdown/roomDetails.dart';
import '../widgets/pageHeader.dart';
import '../widgets/textInput.dart';

class multiUploadPage extends StatefulWidget {
  const multiUploadPage({super.key});

  @override
  State<multiUploadPage> createState() => _multiUploadPageState();
}

class _multiUploadPageState extends State<multiUploadPage> {
  ///imageUploadPage
  Uint8List? imageUpload;
  final picker = ImagePicker();
  _selectImage(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            backgroundColor: Colors.red,
            title: Text(
              'Choose Upload Method',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Take a Photo',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    imageUpload = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Choose from Gallery',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    imageUpload = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '   Cancel',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

///secondaryImagesUploadPage
  List<Uint8List> imageUploads = [];
  _selectImages() async {
    final ImagePicker imagesPicker = ImagePicker();
    List<XFile> file = await imagesPicker.pickMultiImage();
    List<Uint8List> pics = [];
    for(var i = 0; i < file.length; i++) {
      pics.add((await  file[i].readAsBytes()) );
    }
    if (pics.isNotEmpty) {
        imageUploads.addAll(pics);
        setState(() {});
    }
  }

  ///postDetailsUploadPage
  final _formKey1 = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController areaController = TextEditingController();
  TextEditingController noRoomsController = TextEditingController();
  TextEditingController noFloorsController = TextEditingController();
  TextEditingController noBathroomsController = TextEditingController();
  TextEditingController propertyLocationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController propertyTypeController = TextEditingController();
  TextEditingController propertyTitleController = TextEditingController();
  TextEditingController agentNumberController = TextEditingController();
  TextEditingController paymentPeriodController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    propertyLocationController.dispose();
    noFloorsController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    propertyTypeController.dispose();
    propertyTitleController.dispose();
    agentNumberController.dispose();
    paymentPeriodController.dispose();
    areaController.dispose();
    noRoomsController.dispose();
    noBathroomsController.dispose();

  }

  ///geoPointUploadPage
  late GoogleMapController googleMapController;
  CameraPosition? initialPosition;
  Set<Marker> marker = {};
  late GeoPoint loca;
  bool instructionClosed = false;
  bool locationSet = false;
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

  ///uploadingPost
  bool isUploading = false;
  Future<String> uploadProperty()async{
    setState(() {
      isUploading=true;
    });
    String res = await AuthMethods().propertyUpload(
    noRooms: noRoomsController.text,
    noBathrooms: noBathroomsController.text,
    noFloors: noFloorsController.text,
    area: areaController.text,
        description: descriptionController.text,
    price: priceController.text,
    propertyTitle: propertyTitleController.text,
    propertyType: propertyTypeController.text,
    uid: FirebaseAuth.instance.currentUser!.uid,
    agentNumber: agentNumberController.text,
    paymentPeriod: paymentPeriodController.text,
    propertyLocation: propertyLocationController.text,
    secondaryPosts: imageUploads,
    mainPost: imageUpload!,
    postVideo: '',
    mapLocation: GeoPoint(loca.latitude, loca.longitude)
    );
try {
  if (res == 'Success') {
    setState(() {
      isUploading = false;
      showSnackBar('Success! Upload Complete', context);
      Future.delayed(const Duration(seconds: 1));
      navIndex2 = 0;
    });
    Navigator.pushReplacementNamed(context, '/navigationPage');
  }
} catch (err) {
  setState(() {
    isUploading = false;
  });
  res = err.toString();
setState(() {
  showSnackBar(res, context);
});}
return res;
  }

  ///restartUploadingProcess
  restart(){
    propertyLocationController.clear();
    noFloorsController.clear();
    descriptionController.clear();
    priceController.clear();
    propertyTypeController.clear();
    propertyTitleController.clear();
    agentNumberController.clear();
    paymentPeriodController.clear();
    areaController.clear();
    noRoomsController.clear();
    noBathroomsController.clear();
    imageUploads.clear();
    imageUpload?.clear();
    setState(() {
      navIndex2=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      //imageUploadPage
    Scaffold(
      backgroundColor: pRed,
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: lRed,
                  width: .5
                )
              ),
              child: Center(
                child: TextButton(
                  onPressed: (){
                    restart();
                  },
                  child: Text(
                    'RESTART',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: lRed
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        title: const pageHeader(title: 'Image Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 4/3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(8.0) ,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: lRed,
                    width: .5,
                  ),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  imageUpload != null
                      ? Container(
                    width: 900,
                    height: 500,
                    decoration: BoxDecoration(
                        color: pRed,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: lRed,
                            width: .5
                        ),
                        image: DecorationImage(
                            image:  MemoryImage(imageUpload!)
                        )
                    ),
                  )
                      :  Container(
                    width: 900,
                    height: 600,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: pRed,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(
                          color: lRed,
                          width: .5
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'No image selected Yet...',
                        style: GoogleFonts.poppins(
                            color:Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                  sbH20,
                  GestureDetector(
                    onTap: (){
                      _selectImage(context);
                    },
                    child: Container(
                      width: 900,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: lRed,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            imageUpload == null ? 'SELECT IMAGE': 'RESELECT IMAGE',
                            style: GoogleFonts.poppins(
                                color:lRed,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                                letterSpacing: 1.5,
                                wordSpacing: 2.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  sbH10,
                  imageUpload == null ?sb0
                  :GestureDetector(
                    onTap: (){
                      setState(() {
                        navIndex2++;
                      });
                    },
                    child: Container(
                      width: 900,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: lRed,
                              width: .5
                          ),
                          borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'NEXT',
                            style: GoogleFonts.poppins(
                                color:lRed,
                                fontWeight: FontWeight.w400,
                                fontSize: 20.0,
                                letterSpacing: 1.5,
                                wordSpacing: 2.0
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
      //secondaryImagesUploadPage
      Scaffold(
      backgroundColor: pRed,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            setState(() {
              --navIndex2;
            });
          },
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: lRed,
          ),
        ),
        centerTitle: true,
        title: const pageHeader(title: 'Secondary Images Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
      backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: lRed,
                      width: .5
                  )
              ),
              child: Center(
                child: TextButton(
                  onPressed: (){
                    restart();
                  },
                  child: Text(
                    'RESTART',
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: lRed
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
      child: AspectRatio(
      aspectRatio: 4/3,
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
      padding: const EdgeInsets.all(8.0) ,
      decoration: BoxDecoration(
    color: Colors.white,
    border: Border.all(
    color: lRed,
    width: .5,
    ),
    borderRadius: BorderRadius.circular(20.0)
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    imageUploads.isNotEmpty
    ? Container(
    padding:const EdgeInsets.all(10.0) ,
    height: 500,
    width: 900,
    decoration: BoxDecoration(
    color: pRed,
    borderRadius: BorderRadius.circular(15)
    ),
    child: GridView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: imageUploads.length,
    gridDelegate:
    const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1),
    itemBuilder: (BuildContext context,
    int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
          color: pRed,
          image: DecorationImage(image: MemoryImage(imageUploads[index])),
      ),
      ),
    );
    }),
    )
        :  Container(
    width: 900,
    height: 600,
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
    color: pRed,
    borderRadius: BorderRadius.circular(20.0),
    border: Border.all(
    color: lRed,
    width: .5
    ),
    ),
    child: Center(
    child: Text(
    'No Images Selected Yet...',
    style: GoogleFonts.poppins(
    color:Colors.black,
    fontWeight: FontWeight.w400,
    fontSize: 20.0
    ),
    ),
    ),
    ),
    sbH20,
      GestureDetector(
        onTap: (){
          _selectImages();
        },
        child: Container(
          width: 900,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: lRed,
                  width: .5
              ),
              borderRadius: BorderRadius.circular(15.0)
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                imageUploads.isEmpty ? 'SELECT IMAGES': 'ADD IMAGES',
                style: GoogleFonts.poppins(
                    color:lRed,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    wordSpacing: 2.0
                ),
              ),
            ],
          ),
        ),
      ),
      sbH10,
      imageUploads.isEmpty ?sb0
          :GestureDetector(
        onTap: (){
          setState(() {
            navIndex2++;
          });
        },
        child: Container(
          width: 900,
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: lRed,
                  width: .5
              ),
              borderRadius: BorderRadius.circular(15.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NEXT',
                style: GoogleFonts.poppins(
                    color:lRed,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    letterSpacing: 1.5,
                    wordSpacing: 2.0
                ),
              ),
            ],
          ),
        ),
      )
    ],
    ),
    ),
    ),
    ),
    ),
    ),
      //postDetailsUploadPage
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                setState(() {
                  --navIndex2;
                });
              },
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: lRed,
              ),
            ),
            centerTitle: true,
            title: const pageHeader(title: 'Property Details Upload Page', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 0, width: 0),
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: lRed,
                          width: .5
                      )
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: (){
                        restart();
                      },
                      child: Text(
                        'RESTART',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: lRed
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  width: 750,
                  height: 800,
                  child: Form(
                    key: _formKey1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        textInput(
                          controller: propertyTitleController,
                          hinty: 'Property Title',
                          icon: Icons.title_outlined,
                          obscureText: false,
                          textInputType: TextInputType.streetAddress,
                          textCapitalization: TextCapitalization.none,
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              value.characters.toUpperCase();
                              return null;
                            }
                            return'Please enter your the Posts\'s Title';
                          },
                        ),
                        //Description
                        textInput(
                          controller: descriptionController,
                          hinty: 'Enter Description',
                          icon: Icons.add_comment_outlined,
                          obscureText: false,
                          textInputType: TextInputType.name,
                          textCapitalization: TextCapitalization.none,
                          validation: (value) {
                            if (value!.isNotEmpty&&value.characters.length<=340) {
                              value.characters.first.toUpperCase();
                              return null;
                            }
                            return 'Please Enter a Description that is less than 340 characters';
                          },),
                        textInput(
                          controller: agentNumberController,
                          hinty: 'Enter Agent Number',
                          icon: Icons.phone_outlined,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                          validation: (value) {
                            if (value!.isNotEmpty&&value.characters.length >=10) {
                              value.replaceAll(',', '');
                              value.replaceAll(' ', '');
                              return null;
                            }
                            return  'Please Enter the Complete Agent to be Contacted in regards to this Property';
                          },),
                        textInput(
                          controller: priceController,
                          hinty: 'Enter Price',
                          icon: Icons.payments_outlined,
                          obscureText: false,
                          textInputType: TextInputType.number,
                          textCapitalization: TextCapitalization.none,
                          validation: (value) {
                            if (value!.isNotEmpty) {
                              value.replaceAll(',', '');
                              value.replaceAll(' ', '');
                              return null;
                            }
                            return  'Please Enter Property Price';
                          },),
                        //locationDropdown
                        locationCityDetails(textController: propertyLocationController,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //floorDetailsDropdown
                            paymentPeriod(textController: paymentPeriodController),
                            //roomDetailsDropdown
                            propertyTypeDetails(textController: propertyTypeController),
                            //floorDetailsDropdown
                            floorDetails(textController: noFloorsController),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //roomDetailsDropdown
                            roomDetails(textController: noRoomsController),
                            //bathroomsDetailsDropdown
                            bathroomsDetails(textController: noBathroomsController,),
                            //areaDetailsDropdown
                            areaDetails(textController: areaController,),
                          ],
                        ),
                        //ok/nextButton
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 750,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: lRed
                            ),
                            //ifStatement alternative
                             //buttonAlternative
                            child: IconButton(
                              onPressed: (){
                                if (_formKey1.currentState!.validate()) {
                                  // If the form is valid, then invoke the API or whatever you want
                                  setState(() {
                                    _determinePosition();
                                    clientLocations();
                                    navIndex2++;
                                  });
                                }
                              },
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Next',
                                    style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            MediaQuery.of(context).size.width > 1060 ? imageUpload == null?  Container(
                padding: const EdgeInsets.all(20.0),
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    color: pRed,
                    borderRadius: BorderRadius.circular(20.0),
                ),
              child: Center(
                child: Text(
                  'No Primary Pic',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              ): Container(
                padding: const EdgeInsets.all(20.0),
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                    color: pRed,
                    borderRadius: BorderRadius.circular(20.0),
                    image: DecorationImage(
                        image: MemoryImage(imageUpload!),
                        fit: BoxFit.cover
                    )
                ),
              ):sb0,
            ],
          )
      ),
      // geoPointUploadPage
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              setState(() {
                --navIndex2;
              });
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: lRed,
            ),
          ),
          centerTitle: true,
          title: const pageHeader(title: 'Map Location Upload Page', fontSize: 30, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 0, width: 0),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        color: lRed,
                        width: .5
                    )
                ),
                child: Center(
                  child: TextButton(
                    onPressed: (){
                      restart();
                    },
                    child: Text(
                      'RESTART',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: lRed
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
                                      text: ' Tap and Drag the Pin at the Center Of The Screen Behind this Instructions Banner and Move to the Position of The Property a option to continue will appear to the Bottom Right of your Screen when completed correctly ',
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
                        child: TextButton(
                            onPressed: (){
                          setState(() {
                            navIndex2++;
                          });
                        },
                            child: Text(
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
      ),
      //postReviewPage
       locationSet == false ? sb0:Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        leading: IconButton(
        onPressed: (){
        setState(() {
          --navIndex2;
        });
        },
        icon: Icon(
        Icons.arrow_back_ios_outlined,
        color: lRed,
        ),
        ),
        centerTitle: true,
        title: const pageHeader(title: 'Property Review and Upload Page', fontSize: 20, mainAxisAlignment: MainAxisAlignment.center, fontWeight: FontWeight.w500, height: 5, width: 60),
        backgroundColor: Colors.white,
    ),
    body: Center(
    child: Container(
    padding: const EdgeInsets.all(10.0),
    width: 950,
    height: 790,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15.0),
    color: Colors.grey.shade100,
    boxShadow: [BoxShadow(
    color: Colors.grey.shade400,
    offset: const Offset(0.0, 0.0),
    blurRadius: 5.0,
    spreadRadius: 2.0)]),
    child: Column(
    children: [
      Container(
        height: 80,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            pageHeader(
              title: '${propertyTitleController.text.toUpperCase()} - ${propertyTypeController.text.toUpperCase()}', fontSize: 20, mainAxisAlignment: MainAxisAlignment.start, fontWeight: FontWeight.w300, height: 0, width: 2, color: Colors.black,),
          ]
        ),
      ),
    sbH10,
    SizedBox(
    height: 420,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    height: 410,
    width: 350,
    child: Container(
    decoration:  BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    image:  DecorationImage(
    fit: BoxFit.cover,
    image:MemoryImage(
      imageUpload!
    )
    ),
    ),
    ),
    ),
    sb10,
    SizedBox(
    width: 570,
    height: 420,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    children: [
    Container(
    padding: const EdgeInsets.all(10.0),
    width: 390,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    TextButton(
    onPressed: (){},
    child: Row(
    children: [
    Icon(
    Icons.payments_outlined,
    color: lRed,
    ),
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: '  TShs ',
    style: GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    fontSize: 20,
    color: Colors.black),
    ),
    TextSpan(
    text: '${priceController.text}/${paymentPeriodController.text}',
    style: GoogleFonts.galdeano(
    fontWeight: FontWeight.w400,
    fontSize: 25,
    color: Colors.black),
    )
    ]
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    Divider(
    color: lRed,
    thickness: .5,
    ),
    Row(
    children: [
    TextButton(onPressed: (){}, child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Icon(
    Icons.bed_outlined,
    color: lRed,
    ),
    sb5,
    Text(
    noRoomsController.text,
    style: GoogleFonts.galdeano(
    fontSize: 20,
    color: Colors.black
    ),
    ),
    ],
    )),
    sb5,
    TextButton(onPressed: (){}, child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Icon(
    Icons.bathtub_outlined,
    color: lRed,
    ),
    sb5,
    Text(
    noBathroomsController.text,
    style: GoogleFonts.galdeano(
    fontSize: 20,
    color: Colors.black,
    ),
    ),
    ],
    )),
    sb0,
    TextButton(onPressed: (){}, child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Icon(
    MdiIcons.landPlotsMarker,
    color: lRed,
    ),
    sb5,
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text: areaController.text,
    style: GoogleFonts.galdeano(
    fontSize: 20,
    color: Colors.black
    ),
    ),
    TextSpan(
    text: ' ft',
    style: GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    color: Colors.black),
    ),
    WidgetSpan(
    child: Transform.translate(
    offset: const Offset(2, -4),
    child: Text(
    '2',
    style: GoogleFonts.galdeano(
    fontSize: 14,
      color: Colors.black
    ),
    ),
    ),
    )
    ]
    ),
    ),
    ],
    )),
    sb0,
    TextButton(onPressed: (){}, child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Icon(
    MdiIcons.floorPlan,
    color: lRed,
    ),
    sb2,
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text:     noFloorsController.text,
    style: GoogleFonts.galdeano(
    fontSize: 20,
    color: Colors.black
    ),
    ),
    TextSpan(
    text: ' floors',
    style: GoogleFonts.poppins(
    fontWeight: FontWeight.w300,
    color: Colors.black),
    ),
    ]
    ),
    ),
    ],
    )),
    ],
    ),
    Divider(
    color: lRed,
    thickness: .5,
    ),
    TextButton(
    onPressed: (){},
    child: Row(children: [
    Icon(
    Icons.location_on_outlined,
    color: lRed,
    ),
    sb5,
    RichText(
    text: TextSpan(
    children: [
    TextSpan(
    text:  propertyLocationController.text,
    style: GoogleFonts.poppins(
    fontSize: 16,
    letterSpacing: 1,
    wordSpacing: 1,
    fontWeight: FontWeight.w300,
    color: Colors.black),
    )
    ]
    ),
    ),
    ]),
    ),
    ],
    ),
    ),
    sb5,
    Container(
    width: 175,
    height: 150,
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: isUploading == true ?[
      Container(
        padding: const EdgeInsets.all(10.0),
        width: 170,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: Center(
          child: CircularProgressIndicator(
            color: lRed,
            strokeWidth: 4,
          )
        ),
      )
    ]:[
    Padding(
      padding: const EdgeInsets.all(3.0),
      child: GestureDetector(
        onTap: (){
          restart();
        },
        child: Container(
        padding:  const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.transparent,
        border: Border.all(
        color: Colors.red.shade300,
        width: .5,
        )
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: Text(
              'RESTART',
              style: GoogleFonts.poppins(
              color: lRed,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
              ),
              ),
            ),
          ],
        )
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: lRed,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          IconButton(
          highlightColor:Colors.white,
          hoverColor: Colors.white10,
          onPressed: (){
             uploadProperty();
          },
          icon:Text(
          'UPLOAD POST',
          style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.2,
          ),
          )
          ),
        ],
      ),
      ),
    ),
    ],
    ),
    )
    ],
    ),
    sbH10,
    Container(
    padding: const EdgeInsets.all(15.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Description',
    style: GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    letterSpacing: 1,
    wordSpacing: 1
    ),
    ),
    RichText(
    text: TextSpan(children: [
    TextSpan(
    text: '${DateFormat.yMMMd().format(DateTime.now())}\n',
    style: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.black)),
    TextSpan(
    text: descriptionController.text,
    style: GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: Colors.black)),
    ]))
    ],
    ),
    ),
    sbH10,
    ],
    ),
    )
    ],
    ),
    ),
    SizedBox(
    height: 260,
    child: Row(
    children: [
    Container(
    width:555,
    decoration: BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(15.0),
    ),
    child: ListView.builder(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    scrollDirection: Axis.horizontal,
    itemCount: imageUploads.length,
    itemBuilder: (context, index){
    return Padding(
    padding: const EdgeInsets.only(right: 8.0),
    child: Stack(
    children: [
    Container(
    height: 260,
    width: 260,
    decoration:BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15.0),
    image: DecorationImage(
    image: MemoryImage(
    imageUploads[index],
    )
    )
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left:8.0),
    child: Container(
    width: 30.0,
    height: 30.0,
    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
    decoration: const BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black26
    ),
    child: Center(
    child: Text(
    '${index+1}',
    style: GoogleFonts.galdeano(
    color:Colors.white,
    fontWeight: FontWeight.bold
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    );
    }
    ),
    ),
    sb10,
    Stack(
    alignment: Alignment.bottomCenter,
    children: [
    Container(
    width: 360,
    height: 260,
    decoration: BoxDecoration(
    color: Colors.green.shade100,
    borderRadius: BorderRadius.circular(15.0),
    border: Border.all(
    color: Colors.green.shade600,
    width: .5,
    )
    ),
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(loca.latitude, loca.longitude),zoom: 18),
        markers: {
          Marker(
              markerId: const MarkerId('Property Location'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            position: LatLng(loca.latitude, loca.longitude),
          )
        },

      ),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    color: Colors.black12,
    border: Border.all(
    color: Colors.green.shade200,
    width: .5,
    )
    ),
    child: IconButton(
    onPressed: (){
    setState(() {
    navIndex = 6;
    });
    },
    icon:Text(
    'Map Location ',
    style: GoogleFonts.poppins(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.2,
    ),
    )
    ),
    ),
    ),
    ],
    )
    ],
    ),
    )
    ],
    ),
    ),
    ),
    )
    ];
    return Scaffold(
      body: pages[navIndex2] ,
    );
  }
}
