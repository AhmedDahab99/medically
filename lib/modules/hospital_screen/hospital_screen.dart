import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:medically/models/hospitalsModel.dart';
import 'package:medically/shared/cubit/app_cubit.dart';
import 'package:medically/shared/cubit/app_states.dart';
import 'package:medically/shared/style/themes/dark_theme.dart';
import 'package:medically/shared/style/themes/light_theme.dart';

import '../../shared/componnet/component.dart';

class HospitalScreen extends StatefulWidget {
  final List<HospitalsModel> hospitals;

  const HospitalScreen({Key key, @required this.hospitals}) : super(key: key);

  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<Map<String, LatLng>> locations = [
    {'مستشفى الجامعة': LatLng(30.573087877731314, 31.011171200500314),},
    {"مستشفى الامومة": LatLng(30.574270248016063, 31.013188221655486),},
    {"مستشفي شبين الكوم": LatLng(30.57516796793824, 31.012214036286526)},
    {"المستشفى الرمد": LatLng(30.563088929240603, 31.0145788429387)},
    {'مستشفى الهلال': LatLng(30.55762401392208, 31.006035506374566),},
    {"مستشفى المعلمين": LatLng(30.554164987568754, 31.0043430903147),},
    {"مستشفي العسكري": LatLng(30.558464790078652, 31.019542114687564)},
    {"مستشفي قويسنا": LatLng(30.55638517851531, 31.139285685436402)},
    {'مستشفى الايمان': LatLng(30.47675638851377, 31.184893355625444),},
    {"مستشفى كفر شكر": LatLng(30.559361488338673, 31.253099864757807),},
    {"حميات بنها": LatLng(30.478478043952034, 31.18118337814126)},
    {"مستشفي كوم حمادة": LatLng(30.76791242961506, 30.686951527888535)},
    {'مستشفى دمنهور': LatLng(31.055611485545743, 30.46190133130783),},
    {"مستشفى الرمد دمنهور": LatLng(31.04677811492645, 30.467927149854038),},
    {"مستشفي الزهراء": LatLng(31.026354977227015, 30.47422078255786)},
    {"مستشفي دار السلام": LatLng(31.03599340826583, 30.47395296840025)},
    {"مستشفي الزهور": LatLng(31.26443661386578, 32.25870379249922)},

    //31.26443661386578, 32.25870379249922
  ];
  // images marks
  /*BitmapDescriptor hospitalIcon;
  BitmapDescriptor currentIcon;

  @override
  void initState() {
    getHospitalIcon();
    getCurrentIcon();
    super.initState();
  }
  getHospitalIcon() async {
    var hospitalIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(1,1)),
        "assets/images/hospital_mark.png");
    setState(() {
      this.hospitalIcon = hospitalIcon;
    });
  }
  getCurrentIcon() async {
    var currentIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(1,1)),
        "assets/images/location.png");
    setState(() {
      this.currentIcon = currentIcon;
    });
  }*/

  GoogleMapController mapController;
  Map<String, Marker> markers = {};
  // get current loc
  Future<LatLng> getCurrentLocation() async {
    LatLng userLocation = LatLng(0.0, 0.0);
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userLocation = LatLng(position.latitude, position.longitude);
    return userLocation;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    print(31.028951800000016-30.686951527888535);
    // paint(locations);
    setState(() {});
  }

  // paint location's mark
  void paint(List<Map<String, LatLng>> _locations) {
    _locations.forEach((loc) {
      var marker = Marker(
          zIndex: 13,
          onTap: (){
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  elevation: 5,
                  backgroundColor: AppCubit.get(context).isDark
                      ? darkTheme.primaryColorDark
                      : lightTheme.primaryColorLight,
                  title: Center(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('تفاصيل المستشفي'),
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.black,
                      )
                    ],
                  )),
                  //titlePadding: EdgeInsets.symmetric(horizontal: 40),
                  titleTextStyle: AppCubit.get(context).isDark
                      ? darkTheme.textTheme.caption
                      : lightTheme.textTheme.caption,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)
                  ),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Column(
                          children: [
                            Text('لفتح عنوان المستشفي علي خرائط جوجل',
                            style: AppCubit.get(context).isDark
                                ? darkTheme.textTheme.caption
                                : lightTheme.textTheme.caption,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusDirectional.only(
                                      topStart: Radius.circular(30),
                                      bottomEnd: Radius.circular(30)
                                  )
                              ),
                              color: !AppCubit.get(context).isDark
                                  ? darkTheme.primaryColorDark
                                  : lightTheme.primaryColorLight,
                              elevation: 4,
                              height: 10,
                              minWidth: 6,
                              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 6),
                              child: Text('اضغط هنا',
                                style: !AppCubit.get(context).isDark
                                    ? darkTheme.textTheme.headline4.copyWith(
                                    color: Colors.white
                                )
                                    : lightTheme.textTheme.headline4.copyWith(
                                    color: Colors.black
                                ),
                              ),
                              onPressed: () {
                                launchMaps(loc.values.first.latitude, loc.values.first.longitude);
                              },
                            ),
                          ],
                        ),
                        myDivider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('${loc.keys.first}',
                            style:AppCubit.get(context).isDark
                                ? darkTheme.textTheme.caption
                                : lightTheme.textTheme.caption),
                            Text(':اسم المستشفي',
                              style:AppCubit.get(context).isDark
                                  ? darkTheme.textTheme.subtitle1.copyWith(
                                  color: Colors.white.withOpacity(0.6)
                              )
                                  : lightTheme.textTheme.subtitle1.copyWith(
                                  color: Colors.black.withOpacity(0.6)
                              ),),
                          ],
                        ),
                        myDivider(),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(30),
                              bottomEnd: Radius.circular(30)
                            )
                          ),
                          color: !AppCubit.get(context).isDark
                              ? darkTheme.primaryColorDark
                              : lightTheme.primaryColorLight,
                          elevation: 4,
                          height: 15,
                          minWidth: 6,
                          padding: EdgeInsets.symmetric(horizontal: 26),
                          child: Text('غلق',
                            style: !AppCubit.get(context).isDark
                                ? darkTheme.textTheme.headline4.copyWith(
                                color: Colors.white
                            )
                                : lightTheme.textTheme.headline4.copyWith(
                                color: Colors.black
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          infoWindow: InfoWindow(
            title: loc.keys.first,
          ),
          markerId: MarkerId(locations.indexOf(loc).toString()),
          position: loc.values.first);
      markers[loc.keys.first] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states){},
      builder: (context,states){
         return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    "حدد موقعك الحالي لتحديد المستشفيات القريبة منك",
                    style: TextStyle(fontFamily: "ElMessiri-Regular", fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        indoorViewEnabled: false,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(30.56457440424428, 31.011497511816902),
                          zoom: 14,
                        ),
                        onMapCreated: _onMapCreated,
                        markers: markers.values.toSet(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
            floatingActionButton: FloatingActionButton(
              tooltip: "Get User Current Location",
              child: Icon(Icons.location_on_rounded),
              backgroundColor: Color(0xfffd556d),
              onPressed: () async {
                LatLng _currentLocation = await getCurrentLocation();
                mapController..moveCamera(CameraUpdate.newLatLng(_currentLocation));
                //..moveCamera(CameraUpdate.scrollBy(0, 65))
                filtering(_currentLocation);
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  void filtering(LatLng userLocation) {
    paint(locations);
    markers['user location'] = Marker(
        position: userLocation,
        zIndex: 13,
        onTap: () => launchMaps(userLocation.latitude, userLocation.longitude),
        infoWindow: InfoWindow(
          title: "Current Location",
        ),
        markerId: MarkerId("user"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    print(userLocation);
    markers.removeWhere((key, value) {
      var difLat = value.position.latitude-userLocation.latitude;
      var difLng = value.position.longitude-userLocation.longitude;
      var powLat= pow(difLat,2);
      var powLng = pow(difLng,2);
      var latLng = powLat * powLng;
      var result = sqrt(latLng);
      return (result>0.0001);
    });
  }

  static launchMaps(double latitude, double longitude, {String label = ''}) {
    MapsLauncher.launchCoordinates(latitude, longitude, label);
  }
}



