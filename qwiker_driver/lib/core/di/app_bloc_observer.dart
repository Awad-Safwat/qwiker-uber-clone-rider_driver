import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log("created ${bloc.runtimeType.toString()}");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log("Closed ${bloc.runtimeType.toString()}");
  }
}
