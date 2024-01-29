import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/utiles.dart';

class CustomMap extends StatelessWidget {
  const CustomMap(
      {super.key,
      required this.accepteATripCubit,
      this.markers,
      this.polylines,
      required this.cameraPositionLat,
      required this.cameraPositionLong});

  final AccepteATripCubit accepteATripCubit;
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
        accepteATripCubit.mapController = controller;
      },
      zoomGesturesEnabled: true,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      markers: markers ?? {},
      polylines: polylines ?? {},
    );
  }
}

