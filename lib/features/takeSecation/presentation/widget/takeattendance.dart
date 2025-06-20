import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';

class TakeSectionbody extends StatefulWidget {
  const TakeSectionbody(
      {super.key, required this.materialmodels, required this.number});
  final Materialmodels materialmodels;
  final int number;
  @override
  State<TakeSectionbody> createState() => _TakeSectionbody();
}

class _TakeSectionbody extends State<TakeSectionbody> {
//   String _locationMessage = "";
  late Location location;

  @override
  void initState() {
    location = Location();
    getlocations();
    // TODO: implement initState
    super.initState();
  }

  bool isSucess = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.materialmodels.schedule!.course!.name}',
              style: Textstyles.font26medinmblue
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            '${widget.materialmodels.schedule!.sections![widget.number].sectionHall!.name!}',
            style: Textstyles.font26medinmblue
                .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
          ),
          SizedBox(
            width: 40,
          ),
          Text(
            '${widget.materialmodels.schedule!.sections![widget.number].sectionDay!}',
            style: Textstyles.font26medinmblue
                .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
          ),
        ]),
        Center(
          child: Text(
            'Section',
            style: Textstyles.font26medinmblue,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 130,
          backgroundColor: kcolorgraybA,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: kbackgroundcolor,
            child: GestureDetector(
              onTap: isSucess
                  ? () async {
                      String token =
                          await Sharedperfernace.getString('token') ?? '';
                      var data = await location.getLocation();
                      print(" ${data.latitude} ${data.longitude}");
                      await context.read<TakelocationCubit>().getlocationmothed(
                          id: widget.materialmodels.schedule!
                              .sections![widget.number].id!,
                          token: token,
                          latitude:  "30.669295878641602",
                            //  data.latitude.toString(),
                          longitude:  "30.070144100553378",
                             // data.longitude.toString(), //"30.070144100553378",
                          session: "section");
                    }
                  : () {},
              child: consumerschecklocation(
                isSucess: isSucess,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 30,
                  color: kprimarykey,
                ),
                Text(
                  "${widget.materialmodels.schedule!.sections![widget.number].sectionStartHour.toString().substring(0, 5)}",
                  style: Textstyles.font22medinmwithe.copyWith(
                      fontWeight: FontWeight.bold, color: kprimarykey),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Starting Timer',
                  style: Textstyles.font22medinmwithe.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: kprimarykey,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.alarm,
                  size: 30,
                  color: kprimarykey,
                ),
                Text(
                  "${widget.materialmodels.schedule!.sections![widget.number].sectionEndHour.toString().substring(0, 5)}",
                  style: Textstyles.font22medinmwithe.copyWith(
                      fontWeight: FontWeight.bold, color: kprimarykey),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'End of Timer',
                  style: Textstyles.font22medinmwithe.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: kprimarykey,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  void getlocations() async {
    var isactive = await location.serviceEnabled();
    if (!isactive) {
      isactive = await location.requestService();
      if (!isactive) {}
    }
    getpremission();
  }

  void getpremission() async {
    var isactive = await location.hasPermission();
    if (isactive == PermissionStatus.denied) {
      isactive = await location.requestPermission();
      if (isactive != PermissionStatus.granted) {}
    }
  }
}

class consumerschecklocation extends StatefulWidget {
  consumerschecklocation({
    super.key,
    this.isSucess = true,
  });
  bool isSucess;
  @override
  State<consumerschecklocation> createState() => _consumerschecklocationState();
}

class _consumerschecklocationState extends State<consumerschecklocation> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakelocationCubit, TakelocationState>(
      listener: (context, state) {
        if (state is TakelocationSucess) {
          isloading = false;
          widget.isSucess = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Your attandance is done')));
        } else if (state is Takelocationloading) {
          isloading = true;
        } else if (state is TakelocationalrdayRegister) {
          isloading = false;
          widget.isSucess = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You are already is register')));
        } else if (state is Takelocationoutthecollege) {
          isloading = false;
          widget.isSucess = false;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('You are not in the college')));
        } else if (state is TakelocationFailure) {
          isloading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${state.emassage}')));
        } else {
          isloading = false;
        }
      },
      builder: (context, state) {
        if (state is TakelocationSucess) {
          return CircleAvatar(
            radius: 70,
            backgroundColor: kcolorwhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImageChechm),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Done',
                  style:
                      Textstyles.font16boldwithe.copyWith(color: kprimarykey),
                ),
              ],
            ),
          );
        } else if (state is TakelocationalrdayRegister) {
          return CircleAvatar(
            radius: 70,
            backgroundColor: kcolorwhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImageGroup2),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Already',
                  style:
                      Textstyles.font16boldwithe.copyWith(color: kprimarykey),
                ),
              ],
            ),
          );
        } else if (state is TakelocationalrdayRegister) {
          return CircleAvatar(
            radius: 70,
            backgroundColor: kcolorwhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImageGroup2),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Already',
                  style:
                      Textstyles.font16boldwithe.copyWith(color: kprimarykey),
                ),
              ],
            ),
          );
        } else if (state is TakelocationInitial) {
          return CircleAvatar(
            radius: 70,
            backgroundColor: kcolorwhite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.assetsImageGroup2),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'CHECK IN',
                  style:
                      Textstyles.font14medinmblue.copyWith(color: kprimarykey),
                ),
              ],
            ),
          );
        } else {
          return CircleAvatar(
            radius: 70,
            backgroundColor: kcolorwhite,
            child: ModalProgressHUD(
              inAsyncCall: isloading,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.assetsImageGroup2),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'CHECK IN',
                    style: Textstyles.font16medinmbluesetting
                        .copyWith(color: kprimarykey),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

// class TakeSectionbody extends StatefulWidget {
//   const TakeSectionbody({super.key, required this.materialmodels});
//   final Materialmodels materialmodels;
//   @override
//   State<TakeSectionbody> createState() => _TakeSectionbodyState();
// }

// class _TakeSectionbodyState extends State<TakeSectionbody> {
// //   String _locationMessage = "";
//   late Location location;
//   @override
//   void initState() {
//     location = Location();
//     getlocations();
//     // TODO: implement initState
//     super.initState();
//   }
// //   Future<void> _getCurrentLocation() async {
// //     LocationPermission permission = await Geolocator.checkPermission();
// //     if (permission == LocationPermission.denied) {
// //       permission = await Geolocator.requestPermission();
// //       if (permission == LocationPermission.denied) {
// //         setState(() {
// //           _locationMessage = "Location permissions are denied";
// //         });
// //         return;
// //       }
// //     }

// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //     setState(() {
// //       _locationMessage =
// //           "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
// //     });
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 80,
//         ),
//         Text(
//           '${widget.materialmodels.schedule!.lectureStartHour!.padLeft(2, "y")} AM',
//           style: Textstyles.font26medinmblue,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${widget.materialmodels.createdAt}',
//               style: Textstyles.font16boldwithe
//                   .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Text(
//               '${widget.materialmodels.schedule!.lectureDay}',
//               style: Textstyles.font16boldwithe
//                   .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
//             ),
//           ],
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${widget.materialmodels.schedule!.doctor!.user!.name}',
//               style: Textstyles.font16boldwithe
//                   .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
//             ),
//             SizedBox(
//               width: 40,
//             ),
//             Text(
//               '${widget.materialmodels.schedule!.lectureHall!.name}',
//               style: Textstyles.font16boldwithe
//                   .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
//             ),
//           ],
//         ),
//         Text(
//           'Section',
//           style: Textstyles.font26medinmblue,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         CircleAvatar(
//           radius: 130,
//           backgroundColor: kcolorgraybA,
//           child: CircleAvatar(
//             radius: 100,
//             backgroundColor: kbackgroundcolor,
//             child: GestureDetector(
//               onTap: () async {
//                 var data = await location.getLocation();
//                 String token = await Sharedperfernace.getString('token') ?? '';
//                 print(" ${data.latitude} ${data.longitude} section");
//                 var datas = await Apiserverce(Dio()).getloaction(
//                     token: token,
//                     id: widget.materialmodels.academicScheduleId!,
//                     latitude: "30.669295878641602",
//                     longitude: "30.070144100553378",
//                     session: "section");
//                 //  await   _getCurrentLocation();
//                 //    print(_getCurrentLocation().permission)
//               },
//               child: CircleAvatar(
//                 radius: 70,
//                 backgroundColor: kcolorwhite,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset(Assets.assetsImageGroup2),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       'CHECK IN',
//                       style: Textstyles.font16boldwithe
//                           .copyWith(color: kprimarykey),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Column(
//               children: [
//                 Icon(
//                   Icons.timer_outlined,
//                   size: 30,
//                   color: kprimarykey,
//                 ),
//                 Text(
//                   '9:00 AM',
//                   style: Textstyles.font22medinmwithe.copyWith(
//                       fontWeight: FontWeight.bold, color: kprimarykey),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'Starting Timer',
//                   style: Textstyles.font22medinmwithe.copyWith(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w300,
//                     color: kprimarykey,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Icon(
//                   Icons.alarm,
//                   size: 30,
//                   color: kprimarykey,
//                 ),
//                 Text(
//                   '9:00 AM',
//                   style: Textstyles.font22medinmwithe.copyWith(
//                       fontWeight: FontWeight.bold, color: kprimarykey),
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 Text(
//                   'End of Timer',
//                   style: Textstyles.font22medinmwithe.copyWith(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w300,
//                     color: kprimarykey,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         )
//       ],
//     );
//   }

//   void getlocations() async {
//     var isactive = await location.serviceEnabled();
//     if (!isactive) {
//       isactive = await location.requestService();
//       if (!isactive) {}
//     }
//     getpremission();
//   }

//   void getpremission() async {
//     var isactive = await location.hasPermission();
//     if (isactive == PermissionStatus.denied) {
//       isactive = await location.requestPermission();
//       if (isactive != PermissionStatus.granted) {}
//     }
//   }
// }
