import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/request_ride_repo_imple/request_ride_repo_imple.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:qwiker_rider/core/theaming/app_strings.dart';
part 'request_a_ride_state.dart';

class RequestARideCubit extends Cubit<RequestARideState> {
  RequestARideCubit({required requestRideRepoImple})
      : _requestRideRepoImple = requestRideRepoImple,
        super(RequestARideInitial());

  final RequestRideRepoImple _requestRideRepoImple;

  double? riderCurrentPossitionLat;
  double? riderCurrentPossitionLong;
  late GoogleMapController mapController;

  PlaceModel? startPoint;
  PlaceModel? destinationPoint;

  List<LatLng> polylineCoordinates = [];
  double totalDistance = 0;
  BitmapDescriptor? startPointIcon;

  // move thea position to the current rider location
  Future<void> goToRiderCurrentLocation() async {
    final GoogleMapController controller = mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(riderCurrentPossitionLat!, riderCurrentPossitionLong!),
        zoom: 18,
        bearing: 0.0,
        tilt: 0.0,
      ),
    ));
  }

  // get the current location of the rider
  void getCurrentRiderPosition() async {
    emit(GetCurrentPositionLoading());
    var positioin = await _requestRideRepoImple.getCurrentPosition();

    positioin.fold((faluer) {
      emit(GetCurrentPositionFaluer(message: faluer.errorMessage));
    }, (position) {
      riderCurrentPossitionLat = position.latitude;
      riderCurrentPossitionLong = position.longitude;
      goToRiderCurrentLocation();
      emit(GetCurrentPositionLoaded());
    });
  }

  void getPolyPoints(
      {required double startLat,
      required double startLong,
      required double destinationLat,
      required double destinationLong}) async {
    emit(RequestARideLoading());
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      AppStrings.apiKey, // Your Google Map Key
      PointLatLng(startLat, startLong),
      PointLatLng(destinationLat, destinationLong),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    }

    createStartPointMarkr();
    //polulineCoordinates is the List of longitute and latidtude.
    await calculateTotalDistance();

    emit(RequestARideLoaded());
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  Future<void> calculateTotalDistance() async {
    for (var i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += calculateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude);
    }
  }

  createStartPointMarkr() {
    return BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(10, 10)),
      'assets/images/start_point_icon.png',
    ).then((value) => startPointIcon = value);
  }
}
