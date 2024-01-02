import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/serch_place_cubit/search_place_cubit.dart';

class PlacesListItem extends StatelessWidget {
  const PlacesListItem({
    super.key,
    required this.provider,
  });

  final SearchPlaceCubit provider;

  @override
  Widget build(BuildContext context) {
    var requestRideProvider = BlocProvider.of<RequestARideCubit>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Card(
              child: ListTile(
                tileColor: AppColors.whaite,
                leading: const Icon(
                  Icons.place,
                  color: AppColors.mainBlue,
                ),
                title: Text(
                  provider.placesFounded[index].shortName,
                  style: AppFonts.poppinsMedium_16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  provider.placesFounded[index].longName ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.poppinsRegularGray_14,
                ),
                onTap: () {
                  // save the data to the main cubit of requesting a ride feature after user entered
                  if (provider.isDestination) {
                    requestRideProvider.destinationPoint =
                        provider.placesFounded[index];
                    provider.endPointController.text =
                        provider.placesFounded[index].shortName;
                    provider.emitPlaceSelected();
                  } else {
                    requestRideProvider.startPoint =
                        provider.placesFounded[index];
                    provider.startPointController.text =
                        provider.placesFounded[index].shortName;
                    provider.emitPlaceSelected();
                  }
                },
              ),
            ),
          ),
          itemCount: provider.placesFounded.length,
        ),
      ),
    );
  }
}
