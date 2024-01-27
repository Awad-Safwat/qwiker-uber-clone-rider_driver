import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qwiker_rider/core/di/dependency_injection.dart';
import 'package:qwiker_rider/core/global_functions.dart';
import 'package:qwiker_rider/core/theaming/app_colors.dart';
import 'package:qwiker_rider/core/theaming/app_fonts.dart';
import 'package:qwiker_rider/core/widgets/custom_button.dart';
import 'package:qwiker_rider/core/widgets/custom_toast.dart';
import 'package:qwiker_rider/features/profile/data/user_model/rider_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/geometry_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/lat_long_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/place_model.dart';
import 'package:qwiker_rider/features/request_ride/data/models/trip_model.dart';
import 'package:qwiker_rider/features/request_ride/presentation/manager/request_a_ride_cubit/request_a_ride_cubit.dart';

class AvailableRidesWidget extends StatefulWidget {
  const AvailableRidesWidget({super.key});

  @override
  State<AvailableRidesWidget> createState() => _AvailableRidesWidgetState();
}

class _AvailableRidesWidgetState extends State<AvailableRidesWidget> {
  String selectedRide = '';
  @override
  Widget build(BuildContext context) {
    var requestARideCubit = getIt<RequestARideCubit>();

    return Container(
      decoration: BoxDecoration(
          color: AppColors.whaite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r), topRight: Radius.circular(40.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Rides',
                  style: AppFonts.poppinsMedium_20
                      .copyWith(color: AppColors.black),
                ),
                Text(
                  "${requestARideCubit.totalDistance.toStringAsFixed(2)} KM",
                  style: AppFonts.poppinsMedium_16,
                )
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "Car",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 7).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '4+1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child:
                              Image.asset('assets/images/small_car_image.png')),
                      selected: selectedRide == "Car" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          selectedRide = 'Car';
                          requestARideCubit.tripCoast =
                              (requestARideCubit.totalDistance * 10).toInt();
                        });
                      },
                    ),
                  ),
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "TokTok",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 5).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '2+1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child: Image.asset('assets/images/toktok_image.png')),
                      selected: selectedRide == "TokTok" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          selectedRide = 'TokTok';
                          requestARideCubit.tripCoast =
                              (requestARideCubit.totalDistance * 7).toInt();
                        });
                      },
                    ),
                  ),
                  Card(
                    color: AppColors.whaite,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    child: ListTile(
                      title: Text(
                        "Bike",
                        style: AppFonts.poppinsMedium_16,
                      ),
                      trailing: Text(
                        r'$'
                        '${(requestARideCubit.totalDistance * 3).toStringAsFixed(2)}',
                        style: AppFonts.poppinsMedium_16,
                      ),
                      subtitle: Text(
                        '1 Person',
                        style: AppFonts.poppinsRegularGray_12,
                      ),
                      leading: SizedBox(
                          height: 45.h,
                          width: 65.w,
                          child: Image.asset('assets/images/bike_image.png')),
                      selected: selectedRide == "Bike" ? true : false,
                      selectedColor: AppColors.mainBlue,
                      selectedTileColor: AppColors.liteBlue,
                      onTap: () {
                        setState(() {
                          selectedRide = 'Bike';
                          requestARideCubit.tripCoast =
                              (requestARideCubit.totalDistance * 4).toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: CustomButton(
                height: 55.h,
                onPressed: () async {
                  if (requestARideCubit.tripCoast != null) {
                    getPhoneNumber().then(
                      (phoneNumber) => requestARideCubit.bookRide(
                        TripModel(
                          tripTotalDestance: requestARideCubit.totalDistance,
                          tripCoast: requestARideCubit.tripCoast,
                          startPointdata: PlaceModel(
                            placeId: '',
                            shortName: requestARideCubit.startPoint!.longName ??
                                'Current Location',
                            geometry: Geometry(
                              LatLongModel(
                                requestARideCubit
                                    .startPoint!.geometry.location.lat!,
                                requestARideCubit
                                    .startPoint!.geometry.location.long!,
                              ),
                            ),
                          ),
                          endPointdata: PlaceModel(
                            placeId: '',
                            shortName:
                                requestARideCubit.destinationPoint!.longName!,
                            geometry: Geometry(
                              LatLongModel(
                                requestARideCubit
                                    .destinationPoint!.geometry.location.lat!,
                                requestARideCubit
                                    .destinationPoint!.geometry.location.long!,
                              ),
                            ),
                          ),
                          riderData: RiderModel(
                              riderPhone: phoneNumber,
                              email: 'doaa.safwat1999@gmail.com',
                              riderName: 'Doaa Safwat'),
                        ),
                      ),
                    );
                  } else {
                    showCustomToast(message: "Please select A Ride")
                        .show(context);
                  }
                },
                title: "Book Ride",
              ),
            )
          ],
        ),
      ),
    );
  }
}
