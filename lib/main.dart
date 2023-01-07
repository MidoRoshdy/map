import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_map/map.dart';
import 'package:project_map/provider/map_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Map());
}

class Map extends StatelessWidget {
  const Map({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(
          create: (context) => MapProvider(),
        )
      ],
      child: MaterialApp(
        home: MapScreen(),
      ),
    );
    // bottomNavigationBar: Icon(Icons.add),
  }
}
