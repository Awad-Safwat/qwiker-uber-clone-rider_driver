import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:qwiker_driver/features/accepte_a_trip/data/models/review_model.dart';
import 'package:qwiker_driver/features/reviews/data/reviewes_repo_imple.dart';
import 'package:meta/meta.dart';
part 'reviewes_state.dart';

class ReviewesCubit extends Cubit<ReviewesState> {
  ReviewesCubit({required this.reviewesRepoImple}) : super(ReviewesInitial());
  final ReviewesRepoImple reviewesRepoImple;
  List<ReviewModel> reviewes = [];

  void getReviewes(String phoneNumber) async {
    emit(ReviewesLoading());
    var result = await reviewesRepoImple.getReviewes(phoneNumber);
    result.fold((falure) {
      emit(ReviewesFaluer(
        message: falure.errorMessage,
      ));
    }, (result) {
      reviewes = result;
      emit(ReviewesLoaded());
    });
  }
}
