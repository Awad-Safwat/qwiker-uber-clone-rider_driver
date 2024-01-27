import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_driver/core/di/dependency_injection.dart';
import 'package:qwiker_driver/core/routing/views_name.dart';
import 'package:qwiker_driver/core/theaming/app_fonts.dart';
import 'package:qwiker_driver/core/widgets/custom_button.dart';
import 'package:qwiker_driver/features/accepte_a_trip/presentation/manager/accepte_a_trip/accepte_a_trip_cubit.dart';

class TripCostWidget extends StatelessWidget {
  const TripCostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var accepteATripCubit = getIt<AccepteATripCubit>();
    return AlertDialog(
      icon: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Trip cost',
            style: AppFonts.medel_28,
          ),
          Gap(10),
          Icon(
            Icons.monetization_on_outlined,
            size: 40,
          ),
        ],
      ),
      title: Text(
        r'$' '${accepteATripCubit.acceptedTripe!.tripCoast}',
        style: AppFonts.poppinsBoldBlue_30,
      ),
      content: CustomButton(
        onPressed: () {
          accepteATripCubit.endATrip(accepteATripCubit.acceptedTripe!).then(
              (_) => GoRouter.of(context).pushReplacement(ViewsName.homeView));
        },
        title: 'Collect',
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
