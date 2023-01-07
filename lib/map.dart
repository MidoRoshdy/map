import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_map/provider/map_provider.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MapProvider>().drawPolyline();
    return Scaffold(
      body: Consumer<MapProvider>(builder: (context, provider, child) {
        return GoogleMap(
          mapType: MapType.terrain,
          circles: provider.state.circle,
          polylines: provider.state.polyline,
          myLocationEnabled: true,
          markers: provider.state.marker,
          onTap: (argument) {
            provider.AddmMarker(argument);
            print(argument);
          },
          onCameraMove: (position) {
            provider.addCameraMarker(position.target);
          },
          //myLocationButtonEnabled: true,
          initialCameraPosition: provider.state.location1,
          onMapCreated: (GoogleMapController controller) {
            provider.state.controller = controller;
          },
        );
      }),
    );
  }
}
