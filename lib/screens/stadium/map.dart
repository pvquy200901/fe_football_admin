import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPickerWidget extends StatefulWidget {
  @override
  _MapPickerWidgetState createState() => _MapPickerWidgetState();
}

class _MapPickerWidgetState extends State<MapPickerWidget> {
  MapController mapController = MapController();
  LatLng? pickedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn địa điểm'),
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          center: LatLng(10.762622, 106.660172),
          zoom: 13.0,
          onTap:  (tapPosition, point) {
            setState(() {
              pickedLocation = point;
            });

          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'dev.fleaflet.flutter_map.example',
          ),
          MarkerLayer(
            markers: [
              if (pickedLocation != null)
                Marker(
                  point: pickedLocation!,
                  builder: (ctx) => Icon(Icons.location_pin),
                ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pickedLocation != null) {
            Navigator.of(context).pop(pickedLocation);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}