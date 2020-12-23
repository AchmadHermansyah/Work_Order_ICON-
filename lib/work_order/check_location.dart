import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:fluster/fluster.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/location';
  @override
  _MapsHomeState createState() => _MapsHomeState();

  // ambil data dari list work_order;
  final String itemHolder;
  DashboardScreen({Key key, @required this.itemHolder}) : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
  }
}

class _MapsHomeState extends State<DashboardScreen> {
  GoogleMapController _controller;
  Position position;
  Widget _child;
  bool _isButtonDisabled = true;
  @override
  void initState() {
    // _child=RippleIndicator("Getting Location");
    getCurrentLocation();
    super.initState();
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
      _child = mapWidget();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Location'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 8, child: _child),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: cekWidget(),
                    ),
                    Expanded(
                      flex: 6,
                      child: clockWidget(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: buttonWidget(),
            ),
          ],
        ),
      ),
    );
  }

  Widget mapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      markers: _createMarker(),
      initialCameraPosition: CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.5,
      ),
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }

  Widget cekWidget() {
    return Container(
      child: FlatButton(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          width: double.infinity,
          child: Text(
            'Check In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
          decoration: BoxDecoration(
            color: Color(0xFF5C9AD4),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {
          buttonAction();
        },
      ),
    );
  }

  buttonAction() {
    setState(() => _isButtonDisabled = !_isButtonDisabled);
  }

  Widget clockWidget() {
    return Container(
      height: 70,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10.0),
      child: DigitalClock(
        areaAligment: AlignmentDirectional.center,
        // digitAnimationStyle: Curves.elasticOut,
        areaDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        hourMinuteDigitTextStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 40,
        ),
        secondDigitTextStyle: TextStyle(
          color: Colors.blueGrey,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        onPressed: _isButtonDisabled
            ? null
            : () {
                Navigator.pushNamed(context, '/form');
              },
        // onPressed: () {Navigator.pushNamed(context, '/second'); },
        color: Color(0xFFE35E13),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId("Current Location"),
        position: LatLng(position.latitude, position.longitude),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: "Current Location",
        ),
      ),
    ].toSet();
  }
}
