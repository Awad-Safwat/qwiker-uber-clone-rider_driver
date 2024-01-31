import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/accepte_a_trip/data/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 380.w,
        decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: AppColors.gray),
          ],
          border: Border.all(style: BorderStyle.solid),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(2.h),
              RichText(
                text: TextSpan(
                    text: 'Review: ',
                    style: AppFonts.poppinsMediumBlue_20,
                    children: [
                      TextSpan(
                          text: review.comment ?? '',
                          style: AppFonts.poppinsMediumGray_16),
                    ]),
              ),
              Gap(18.h),
              Center(
                child: RatingBarIndicator(
                  rating: review.rate!.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
