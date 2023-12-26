import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_a_ride_state.dart';

class RequestARideCubit extends Cubit<RequestARideState> {
  RequestARideCubit() : super(RequestARideInitial());
}
