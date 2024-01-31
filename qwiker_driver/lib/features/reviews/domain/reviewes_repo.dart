import 'package:dartz/dartz.dart';
import 'package:qwiker_driver/core/exptions/error_handeler.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/review_model.dart';

abstract class ReviewesRepo {
  Future<Either<Falure, List<ReviewModel>>> getReviewes(String phoneNumber);
}
