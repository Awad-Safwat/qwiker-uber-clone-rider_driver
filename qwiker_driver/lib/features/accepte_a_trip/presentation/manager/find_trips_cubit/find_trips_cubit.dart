import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'find_trips_state.dart';

class FindTripsCubit extends Cubit<FindTripsState> {
  FindTripsCubit(super.initialState);

  void waitForNewTrips() {
    print('listening to trips');
    FirebaseFirestore.instance
        .collection("requestedTrips")
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isEmpty) {
        emit(FindTripsNoTripsFounded());
      } else {
        emit(FindTripsNewTripsAdded(trips: snapshot.docs));
      }
    });
  }

  void emitTripAccipted() {
    emit(TripAccepted());
  }
}
