import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qwiker_driver/core/theaming/app_colors.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:qwiker_driver/features/history/presentation/widgets/history_trip_item.dart';
import 'package:qwiker_driver/features/home/presentation/widgets/custom_app_bar.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var historyCubit = BlocProvider.of<HistoryCubit>(context);
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: BlocBuilder<HistoryCubit, HistoryState>(
            builder: (context, state) {
              if (state is HistoryLoaded) {
                if (historyCubit.history.isEmpty) {
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
                            itemCount: historyCubit.history.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: HistoryTripItem(
                                  trip: historyCubit.history[index],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                }
              } else if (state is HistoryFaluer) {
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
