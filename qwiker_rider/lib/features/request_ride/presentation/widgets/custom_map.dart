import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/utiles.dart';

class CustomMap extends StatelessWidget {
  const CustomMap(
      {super.key,
      required this.provider,
      this.markers,
      this.polylines,
      required this.cameraPositionLat,
      required this.cameraPositionLong});

  final RequestARideCubit provider;
  final Set<Marker>? markers;
  final Set<Polyline>? polylines;
  final double? cameraPositionLat;
  final double? cameraPositionLong;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: createCameraPosition(
        late: cameraPositionLat,
        longe: cameraPositionLong,
      ),
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        // if (!provider.mapController.isCompleted) {
        //   //first calling is false
        //   //call "completer()"
        //   provider.mapController.complete(controller);
        // } else {
        //   //other calling, later is true,
        //   //don't call again completer()
        // }
        provider.mapController = controller;
      },
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      markers: markers ?? {},
      polylines: polylines ?? {},
    );
  }
}

_displayDialog() {
  Completer<GoogleMapController> controller = Completer();
}
