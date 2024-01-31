import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/review_model.dart';
import 'package:qwiker_driver/features/reviews/data/reviews_data_source.dart';
import 'package:qwiker_driver/features/reviews/domain/reviewes_repo.dart';

class ReviewesRepoImple implements ReviewesRepo {
  final ReviewesDataSource _reviewesDataSource;

  ReviewesRepoImple({required ReviewesDataSource reviewesDataSource})
      : _reviewesDataSource = reviewesDataSource;
  @override
  Future<Either<Falure, List<ReviewModel>>> getReviewes(
      String phoneNumber) async {
    try {
      List<ReviewModel> reviewes =
          await _reviewesDataSource.getReviewes(phoneNumber);
      return right(reviewes);
    } catch (error) {
      return left(Falure(errorMessage: error.toString()));
    }
  }
}
