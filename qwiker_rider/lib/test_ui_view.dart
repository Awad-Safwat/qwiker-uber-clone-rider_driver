import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_details_section.dart';

import 'package:qwiker_rider/features/request_ride/presentation/widgets/trip_rating_widget.dart';

class TestUiView extends StatefulWidget {
  const TestUiView({super.key});

  @override
  State<TestUiView> createState() => _TestUiViewState();
}

class _TestUiViewState extends State<TestUiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset(
          'assets/images/map.png',
          fit: BoxFit.fill,
        ),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 580.h,
            child: TripDetailsSection(
              buttonOnPressed: () {},
              destinationName: 'al minia',
              driverName: 'Awad',
              fullDistance: 24,
              startLocationName: 'bini mazar',
              tripCoast: 30,
            )),
      ]),
    );
  }
}













// void show(BuildContext context) => showAdaptiveDialog(
//     context: context,
//     builder: (context) => Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
//           child: Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(15)),
//               color: AppColors.mainBlue,
//               clipBehavior: Clip.hardEdge,
//               child: const ChatView()),
//         ));

// class ChatView extends StatelessWidget {
//   const ChatView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.gray,
//       appBar: AppBar(
//         title: const Text('chat'),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const CircleAvatar(
//             radius: 100,
//             backgroundImage: AssetImage(
//               'assets/images/my_photo.jpg',
//             ),
//           ),
//           const Gap(20),
//           CustomButton(
//             onPressed: () {
//               GoRouter.of(context).pop();
//             },
//             title: 'press',
//             height: 40,
//           ),
//           CustomTextFormField(
//               textController: TextEditingController(), hintText: 'hintText')
//         ],
//       ),
//     );
//   }
// }
