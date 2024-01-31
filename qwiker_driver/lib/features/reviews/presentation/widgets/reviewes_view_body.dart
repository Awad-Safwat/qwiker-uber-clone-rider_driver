import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:qwiker_driver/features/reviews/presentation/manager/reviewes_cubit/reviewes_cubit.dart';
import 'package:qwiker_driver/features/reviews/presentation/widgets/review_item.dart';

class ReviewesViewBody extends StatelessWidget {
  const ReviewesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var reviewesCubit = BlocProvider.of<ReviewesCubit>(context);
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: BlocBuilder<ReviewesCubit, ReviewesState>(
            builder: (context, state) {
              if (state is ReviewesLoaded) {
                if (reviewesCubit.reviewes.isEmpty) {
                  return Column(
                    children: [
                      Gap(100.h),
                      Text(
                        'No trips yet',
                        style: AppFonts.poppinsMedium_18,
                      ),
                      Image.asset(
                        'assets/images/waiting_requests.png',
                      )
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: reviewesCubit.reviewes.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: ReviewItem(
                                  review: reviewesCubit.reviewes[index],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                }
              } else if (state is ReviewesFaluer) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.mainBlue),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
