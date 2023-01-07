import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  CameraPosition location1 =
      CameraPosition(target: LatLng(30.050631, 31.349454), zoom: 16);
  Set<Marker> marker = Set<Marker>();
  Set<Circle> circle = Set<Circle>();
  Set<Polyline> polyline = Set<Polyline>();
  PolylinePoints polylinePoints = PolylinePoints();
  late GoogleMapController controller;
}
