import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/core/global_functions.dart';
import 'package:qwiker_driver/features/reviews/data/reviewes_repo_imple.dart';
import 'package:qwiker_driver/features/reviews/presentation/manager/reviewes_cubit/reviewes_cubit.dart';
import 'package:qwiker_driver/features/reviews/presentation/widgets/reviewes_view_body.dart';

class ReviewesView extends StatelessWidget {
  const ReviewesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ReviewesCubit(reviewesRepoImple: getIt<ReviewesRepoImple>())
              ..getReviewes(getPhoneNumber()),
        child: const ReviewesViewBody(),
      ),
    );
  }
}
