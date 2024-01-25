import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/core/theaming/app_strings.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/driver_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/trip_model.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/repos_imple/accepte_a_trip_repos_imple.dart';

part 'accepte_a_trip_state.dart';

class AccepteATripCubit extends Cubit<AccepteATripState> {
  AccepteATripCubit({required accepteAtripReposImple})
      : _accepteAtripReposImple = accepteAtripReposImple,
        super(AccepteATripInitial());

  final AccepteAtripReposImple _accepteAtripReposImple;
  late double driverLocationLat;
  late double driverLocationLong;
  String? driverPhone;
  TripModel? acceptedTripe;
  late GoogleMapController mapController;

  List<LatLng> polylineCoordinates = [];
  double totalDistance = 0;
  BitmapDescriptor? startPointIcon;

  Future<void> acceptATrip(TripModel trip) async {
    emit(AccepteATripLoading());
    await getPhoneNumber().then((phoneNumber) {
      print('driver phone $phoneNumber');
      driverPhone = '01113743069';
      trip.driverData = DriverModel(
          driverLocationLat: driverLocationLat,
          driverLocationLong: driverLocationLong,
          driverPhoneNumber: driverPhone!,
          driverName: 'Driver Awad');
    });

    var result = await _accepteAtripReposImple.accepteAtrip(trip);
    result.fold((falure) {
      emit(AcceptATripFailure(message: falure.errorMessage));
    }, (success) {
      acceptedTripe = trip;
      emit(AcceptedTripSuccess());
    });
  }

  // move thea position to the current rider location
  Future<void> goToDriverCurrentLocation() async {
    final GoogleMapController controller = mapController;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(driverLocationLat, driverLocationLong),
        zoom: 18,
        bearing: 0.0,
        tilt: 0.0,
      ),
    ));
  }

  // get the current location of the Driver
  void getCurrentDriverPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        print('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        print(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).then((position) {
        driverLocationLat = position.latitude;
        driverLocationLong = position.longitude;
        print("Driver lat$driverLocationLat");
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void notifyDriverOnStartPoint() async {
    polylineCoordinates.clear();
    getPolyPoints(
            startLat: acceptedTripe!.startPointdata.geometry.location.lat!,
            startLong: acceptedTripe!.startPointdata.geometry.location.long!,
            destinationLat: acceptedTripe!.endPointdata.geometry.location.lat!,
            destinationLong:
                acceptedTripe!.endPointdata.geometry.location.long!)
        .then((_) {
      changeTripStateToOnStart(acceptedTripe!.riderData!.riderPhone);
      emit(DriverOnStartPoint());
    });
  }

  void notifyDriverOnWayToStartPoint() async {
    polylineCoordinates.clear();
    getPolyPoints(
      startLat: driverLocationLat,
      startLong: driverLocationLong,
      destinationLat: acceptedTripe!.startPointdata.geometry.location.lat!,
      destinationLong: acceptedTripe!.startPointdata.geometry.location.long!,
    ).then((value) => emit(GoingToRiderLocation()));
  }

  void startTrip(String riderPhone) {
    FirebaseFirestore.instance
        .collection('onGoingTrips')
        .doc(riderPhone)
        .update({'tripStates': 'TripIsStarted'});
    emit(TripIsStarted());
  }

  Future<void> notifyOnDestinaionPoint(String riderPhone) async {
    return FirebaseFirestore.instance
        .collection('onGoingTrips')
        .doc(riderPhone)
        .update({'tripStates': 'On destination'});
  }

  Future<void> changeTripStateToOnStart(String riderPhone) async {
    return FirebaseFirestore.instance
        .collection('onGoingTrips')
        .doc(riderPhone)
        .update({'tripStates': 'On Start point'});
  }

  Future<void> endATrip(TripModel trip) async {
    await _accepteAtripReposImple.endAtrip(trip);
  }

  Future<void> getPolyPoints(
      {required double startLat,
      required double startLong,
      required double destinationLat,
      required double destinationLong}) async {
    emit(LoadingRoutes());
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

    await createStartPointMarkr();
    //polulineCoordinates is the List of longitute and latidtude.
    await calculateTotalDistance();

    emit(LoadedRoutes());
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
      const ImageConfiguration(),
      'assets/images/driver_icon.png',
    ).then((value) => startPointIcon = value);
  }
}
