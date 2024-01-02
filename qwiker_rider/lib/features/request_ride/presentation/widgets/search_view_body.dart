import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/routing/views_name.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/features/request_ride/data/models/geometry_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/lat_long_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/serch_place_cubit/search_place_cubit.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/places_list_items.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/search_view_search_part_section.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = BlocProvider.of<SearchPlaceCubit>(context);
    var requestARideCubit = getIt<RequestARideCubit>();
    return Column(
      children: [
        Gap(10.h),
        SearchVeiwSearchPartSection(provider: provider),
        BlocBuilder<SearchPlaceCubit, SearchPlaceState>(
          builder: (context, state) {
            if (state is SearchPlaceFaluer) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: Text(state.message),
                  ),
                ),
              );
            } else if (state is SearchPlaceLoadedSuccess) {
              return PlacesListItem(provider: provider);
            } else if (state is SearchPlaceLoading) {
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return const Spacer();
            }
          },
        ),
        // const Spacer(),
        CustomButton(
            height: 50.h,
            onPressed: () {
              requestARideCubit.startPoint ??= PlaceModel(
                  geometry: Geometry(
                    LatLongModel(
                      requestARideCubit.riderCurrentPossitionLat,
                      requestARideCubit.riderCurrentPossitionLong,
                    ),
                  ),
                  shortName: "Your Location",
                  placeId: "placeId");
              print(requestARideCubit.destinationPoint?.longName ?? 'good');
              print(requestARideCubit.startPoint?.longName);
              GoRouter.of(context).replace(ViewsName.confirmRideView);
            },
            title: 'Confirm Places'),
        const Gap(10)
      ],
    );
  }
}
