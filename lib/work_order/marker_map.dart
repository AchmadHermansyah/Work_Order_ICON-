import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woicon/helpers/map_marker.dart';
import 'package:woicon/helpers/map_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class marker_map extends StatefulWidget {
  static const routeName = '/map_marker';
  @override
  _HomePageState createState() => _HomePageState();
}

// class Row {
//   Float latitude;
//   Float longitude;
//   String nm_lokasi;
//
//   Row({this.latitude, this.longitude, this.nm_lokasi});
//
//   @override
//   String toString() {
//     return 'Row{latitude: $latitude, longitude: $longitude, nm_lokasi: $nm_lokasi}';
//   }
//
//   factory Row.fromJson(Map<String, dynamic> json) {
//     return Row(
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         nm_lokasi: json["nm_lokasi"]
//     );
//   }
// }
//
// class Lokasi {
//   List<Row> rows;
//
//   Lokasi({this.rows});
//
//   @override
//   String toString() {
//     return 'Lokasi{rows: $rows}';
//   }
//
//   factory Lokasi.fromJson(Map<String, dynamic> json) {
//     return Lokasi(
//         rows: List<Row>.from(json["rows"].map((row) {
//           return Row.fromJson(row);
//         }))
//     );
//   }
// }

class _HomePageState extends State<marker_map> {

  void initState() {
    // _child=RippleIndicator("Getting Location");
    getCurrentLocation();
    getlist();
  }

  Position position;

  final Completer<GoogleMapController> _mapController = Completer();

  final storage = new FlutterSecureStorage();

  /// Url image used on normal markers
  final String _markerImageUrl = 'https://img.icons8.com/office/80/000000/marker.png';

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  Fluster<MapMarker> _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 15;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Color of the cluster circle
  final Color _clusterColor = Colors.blue;

  /// Color of the cluster text
  final Color _clusterTextColor = Colors.white;

  getlist() async {
    String table_id = "2307531105f9fbd34e87cb8022682379";
    String access_token = await storage.read(key: 'token');
    final response = await http.get(
        "http://10.14.23.240:8081/api/1.0/workflow/pmtable/$table_id/data?access_token=$access_token");
    // if (response.statusCode == 200){
        var data = json.decode(response.body);
        print('Howdy, $data!');
  }

  void getCurrentLocation() async {
    Position res = await Geolocator().getCurrentPosition();
    setState(() {
      position = res;
    });
  }

  /// Example marker coordinates
  final List<LatLng> _markerLocations = [
    LatLng(-6.2924444, 106.770925),
    LatLng(-6.2390247,106.7961014),
    LatLng(-6.21894,106.8311831),
    LatLng(-6.2244831,106.8231347),
    LatLng(-6.2372283,106.8212036),
    LatLng(-6.2138931,106.7941706),
    LatLng(-6.2583908,106.8351475),
    LatLng(-6.2102833,106.8522011),
    LatLng(-6.14216,106.50209)
  ];

  /// Called when the Google Map widget is created. Updates the map loading state
  /// and inits the markers.
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);

    setState(() {
      _isMapLoading = false;
    });

    _initMarkers();
  }

  /// Inits [Fluster] and all the markers with network images and updates the loading state.
  void _initMarkers() async {
    final List<MapMarker> markers = [];

    for (LatLng markerLocation in _markerLocations) {
      final BitmapDescriptor markerImage =
      await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

      markers.add(
        MapMarker(
          id: _markerLocations.indexOf(markerLocation).toString(),
          position: markerLocation,
          icon: markerImage,
        ),
      );
    }

    _clusterManager = await MapHelper.initClusterManager(
      markers,
      _minClusterZoom,
      _maxClusterZoom,
    );

    await _updateMarkers();
  }

  /// Gets the markers and clusters to be displayed on the map for the current zoom level and
  /// updates state.
  Future<void> _updateMarkers([double updatedZoom]) async {
    if (_clusterManager == null || updatedZoom == _currentZoom) return;

    if (updatedZoom != null) {
      _currentZoom = updatedZoom;
    }

    setState(() {
      _areMarkersLoading = true;
    });

    final updatedMarkers = await MapHelper.getClusterMarkers(
      _clusterManager,
      _currentZoom,
      _clusterColor,
      _clusterTextColor,
      80,
    );

    _markers
      ..clear()
      ..addAll(updatedMarkers);

    setState(() {
      _areMarkersLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markers and Clusters Example'),
      ),
      body: Stack(
        children: <Widget>[
          // Google Map widget
          Opacity(
            opacity: _isMapLoading ? 0 : 1,
            child: GoogleMap(
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapToolbarEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: _currentZoom,
              ),
              markers: _markers,
              onMapCreated: (controller) => _onMapCreated(controller),
              onCameraMove: (position) => _updateMarkers(position.zoom),
            ),
          ),

          // Map loading indicator
          Opacity(
            opacity: _isMapLoading ? 1 : 0,
            child: Center(child: CircularProgressIndicator()),
          ),

          // Map markers loading indicator
          if (_areMarkersLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  elevation: 2,
                  color: Colors.grey.withOpacity(0.9),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      'Loading',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
