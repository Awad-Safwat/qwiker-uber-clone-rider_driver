import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/features/history/data/history_repo_imple.dart';
import 'package:qwiker_rider/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:qwiker_rider/features/history/presentation/widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            HistoryCubit(historyRepoImple: getIt<HistoryRepoImple>())
              ..getHistory(getPhoneNumber()),
        child: const HistoryViewBody(),
      ),
    );
  }
}
