import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';

class TripRatingWidget extends StatelessWidget {
  const TripRatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();
    return AlertDialog(
      icon: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Rating',
            style: AppFonts.medel_28,
          ),
          Gap(5),
          Icon(
            Icons.rate_review_outlined,
            size: 40,
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                requestARideCubit.currentTrip!.tripReview?.rate =
                    rating.toInt();
              },
            ),
            const Gap(5),
            TextField(
              maxLines: 5,
              minLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintStyle: TextStyle(),
                  hintText: 'Write A Comment here'),
              onChanged: (comment) {
                requestARideCubit.currentTrip!.tripReview?.comment = comment;
              },
              onSubmitted: (comment) {
                requestARideCubit.currentTrip!.tripReview?.comment = comment;
              },
            ),
            const Gap(5),
            CustomButton(
              height: 40,
              onPressed: () {
                requestARideCubit
                    .endAtrip(requestARideCubit.currentTrip!)
                    .then((_) {
                  GoRouter.of(context).pushReplacement(ViewsName.homeView);
                });
              },
              title: 'Rate',
            ),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
