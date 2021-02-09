import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:happy_hours/club_main_page.dart';
import 'package:happy_hours/model/club_model.dart';
import 'package:location/location.dart';
import 'customIcons.dart';
import 'data/data.dart';
import 'dart:math';


void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PageController _pageController;
  GoogleMapController mapController;
  final LatLng _center = const LatLng(41.3203574, 19.8268523);
  List<Marker> allMarkers = [];
  Set<Circle> circles;
  TextEditingController _controller;
  List<ClubModel> allClubs = [];
  LocationData currentLocation;
  Location location;

  bool _serviceEnabled;
  LocationData _locationData;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
    _controller = TextEditingController();

    location = new Location();

    //setInitialLocation();
  }

  void setInitialLocation() async {
    currentLocation = await location.getLocation();

    print("----------------------------- beni");
    print(currentLocation.altitude);
  }


  _addAllClubsToMap(List<ClubModel> clubs) {
    allMarkers.clear();
    clubs.forEach((clubs) => {
      allMarkers.add(_createMarker(clubs.name, clubs.latitude, clubs.longitude))
    });

    allClubs.clear();
    allClubs = clubs;
  }

  _findClub(double distance) {
    List<ClubModel> filterList = clubs.where((club) =>
        _getDistanceFromLatLonM(club.latitude, club.longitude, 41.3266127, 19.8229724, distance)
    ).toList();

    _addAllClubsToMap(filterList);
  }


  Marker _createMarker(String clubName, double latitude, double longitude) {
    return Marker(
      markerId: MarkerId(clubName),
      draggable: false,
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: clubName)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[

            GoogleMap(
              circles: circles,
              onMapCreated: _onMapCreated,
              myLocationButtonEnabled: true,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              markers: Set.from(allMarkers),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 8.0, right: 8.0, left: 8.0),
                  height: 200,
                  width: double.infinity,
                  child: _buildList(allClubs, context)),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,

              child: Padding(
                padding: const EdgeInsets.only(top : 32, right : 8.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.remove_red_eye, color: Colors.red),
                    onPressed:() {
                      selectDistanceDialog((distance){
                        print(distance.toString());
                        setState(() {
                          _findClub(distance);
                        });
                      });
                    }),
              )
            ),
          ],
        ));
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildList(List<ClubModel> clubs, BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: GestureDetector(
                onTap: () {
                  /*Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ClubMainPage();
                  }));*/
                  _navigateToClubPage();
                  print(clubs[index].name);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Colors.grey[100],
                  ),
                  width: 150,
                  child: Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0)),
                        child: Image(
                            image: AssetImage(clubs[index].image),
                            fit: BoxFit.fill,
                            colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 4.0, bottom: 4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(clubs[index].name),
                              Text(clubs[index].description)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(right: 4.0, bottom: 4.0),
                          child: GestureDetector(
                            onTap: () {
                              print(clubs[index].name + ' Get direction');
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                    color: Colors.blue),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.directions_run,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }

  selectDistanceDialog(Function(double) callback) {

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Vendosni distancen e deshiruar ne metra'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        controller: _controller,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      )
                    ),
                    SizedBox(
                      width: 320.0,
                      child: RaisedButton(
                        onPressed: () {
                          print(_controller.text + 'kirsrsr');
                          callback(double.parse(_controller.text));
                          _controller.clear();
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });

  }

  _navigateToClubPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ClubMainPage();
    }));
  }

  bool _getDistanceFromLatLonM(lat1,lon1, lat2, lon2, double distance) {
    final int earthR = 6371;
    double dLat = _deg2rad(lat2 - lat1);
    double dLon = _deg2rad(lon2 - lon1);

    var a =
        sin(dLat / 2) * sin(dLat/ 2) +
        cos(_deg2rad(lat1)) * cos(_deg2rad(lat2)) *
        sin(dLon/2) * sin(dLon/2);

    var c = 2 * atan2(sqrt(a), sqrt(1 - a ));
    var d = earthR * c * 1000;

    if(d <= distance) {
      return true;
    }else {
      return false;
    }
  }

  double _deg2rad(double deg) {
    return deg * (pi / 100);
  }
}



