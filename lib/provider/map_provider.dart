import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:project_map/provider/map_state.dart';
import 'package:google_directions_api/google_directions_api.dart'
    hide TravelMode;

class MapProvider extends ChangeNotifier {
  MapState state = MapState();
  AddmMarker(LatLng argument) async {
    // state.marker.add(
    //   Marker(
    //       markerId: MarkerId(Random().nextInt(999999).toString()),
    //       position: argument),
    // );
    // state.circle.add(Circle(
    //     circleId: CircleId(Random().nextInt(999999).toString()),
    //     center: argument,
    //     radius: 100));
    // state.polylinesPositions.add(argument);

    notifyListeners();
  }

// LatLng(30.05844092057013, 31.222098134458065)
//LatLng(30.17895268786175, 31.58763628453016)
  addCameraMarker(LatLng argument) {
    // state.marker.add(
    //   Marker(markerId: MarkerId("cameraMarker"), position: argument),
    // );
    // notifyListeners();
  }

  drawPolyline() async {
    state.marker.add(
      Marker(
          markerId: MarkerId("start"),
          position: LatLng(30.05844092057013, 31.222098134458065)),
    );

    state.marker.add(
      Marker(
          markerId: MarkerId("end"),
          position: LatLng(30.17895268786175, 31.58763628453016)),
    );

    PolylineResult result = await state.polylinePoints
        .getRouteBetweenCoordinates(
            "AIzaSyC9QVwsUc78UVUHOjyr5pefEU1G6TznhWM",
            travelMode: TravelMode.walking,
            PointLatLng(30.05844092057013, 31.222098134458065),
            PointLatLng(30.17895268786175, 31.58763628453016));
    state.polyline.add(
      Polyline(
          color: Colors.red,
          width: 3,
          polylineId: PolylineId("polyline"),
          points: result.points
              .map((e) => LatLng(e.latitude, e.longitude))
              .toList()),
    );
    state.controller.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(30.05844092057013, 31.222098134458065),
          zoom: 13,
        ),
      ),
    );

    // distance & duration
    state.directionsService.route(
        DirectionsRequest(
          origin: 'New York',
          destination: 'San Francisco',
        ), (response, status) {
      if (status == DirectionsStatus.ok) {
        response.geocodedWaypoints![0];
      } else {
        // do something with error response
      }
    });
    notifyListeners();
  }
}
