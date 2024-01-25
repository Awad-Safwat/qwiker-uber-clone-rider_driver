import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/serch_place_cubit/search_place_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_bickup_icon.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/custom_destination_icon.dart';

class SearchVeiwSearchPartSection extends StatelessWidget {
  const SearchVeiwSearchPartSection({
    super.key,
    required this.provider,
  });

  final SearchPlaceCubit provider;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: Card(
        color: AppColors.whaite,
        elevation: .3,
        shadowColor: AppColors.gray,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                ),
              ),
              ListTile(
                leading: const CustomBickUpIcon(),
                title: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 45.h,
                    maxWidth: 300.w,
                  ),
                  child: CustomTextFormField(
                    textController: provider.startPointController,
                    hintText: 'Eneter pick Up Location',
                    hintStyle: AppFonts.poppinsRegularGray_12,
                    onChanged: (text) {
                      provider.isDestination = false;
                    },
                    onSave: (text) {
                      provider.searchForPlace(text ?? '');
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.h),
                child: Text(
                  'your current location is defult',
                  style: AppFonts.poppinsRegularGray_12,
                ),
              ),
              Gap(5.h),
              Divider(
                height: 1.h,
                color: AppColors.liteGray,
                indent: 68.w,
                endIndent: 24.w,
              ),
              Gap(5.h),
              ListTile(
                leading: const CustomDestinationIcon(),
                title: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 45.h,
                    maxWidth: 300.w,
                  ),
                  child: CustomTextFormField(
                    textController: provider.endPointController,
                    hintText: 'Eneter Destination',
                    hintStyle: AppFonts.poppinsRegularGray_12,
                    autoFoucus: true,
                    onChanged: (text) {
                      provider.isDestination = true;
                    },
                    onSave: (text) {
                      provider.searchForPlace(text ?? '');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
