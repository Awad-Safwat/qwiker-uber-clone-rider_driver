import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:qwiker_rider/core/exptions/error_handeler.dart';
import 'package:qwiker_rider/features/request_ride/data/data_source/remote_data_source.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/domain/request_ride_repo.dart';

class RequestRideRepoImple extends RequestRideRepo {
  final RequestRideRemoteDataSource _requestRideRemoteDataSource;

  RequestRideRepoImple(
      {required RequestRideRemoteDataSource requestRideRemoteDataSource})
      : _requestRideRemoteDataSource = requestRideRemoteDataSource;

  // get the rider current location
  @override
  Future<Either<Falure, Position>> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      return left(Falure(errorMessage: 'Location services are disabled.'));
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return left(Falure(errorMessage: 'Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return left(Falure(
          errorMessage:
              'Location permissions are permanently denied, we cannot request permissions.'));
    }
    // continue accessing the position of the device.
    return right(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
  }

  @override
  Future<Either<Falure, List<PlaceModel>>> searchForPlace(
      String? searchText) async {
    try {
      List<PlaceModel> places =
          await _requestRideRemoteDataSource.searchForPlace(searchText);
      return right(places);
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }

  @override
  Either<Falure, Future<void>> bookATrip(TripModel? trip) {
    try {
      return right(_requestRideRemoteDataSource.bookATrip(trip!));
    } catch (error) {
      return left(
        Falure(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
