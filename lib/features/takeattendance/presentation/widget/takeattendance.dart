import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';

class Takeattendancebody extends StatefulWidget {
  const Takeattendancebody({super.key, required this.materialmodels});
  final Materialmodels materialmodels;
  @override
  State<Takeattendancebody> createState() => _TakeattendancebodyState();
}

class _TakeattendancebodyState extends State<Takeattendancebody> {
//   String _locationMessage = "";
  late Location location;

  @override
  void initState() {
    location = Location();

    getlocations();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
        ),
        Text(
          '${widget.materialmodels.schedule!.lectureStartHour!.padLeft(2, "y")} AM',
          style: Textstyles.font26medinmblue,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.materialmodels.createdAt}',
              style: Textstyles.font16boldwithe
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${widget.materialmodels.schedule!.lectureDay}',
              style: Textstyles.font16boldwithe
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.materialmodels.schedule!.doctor!.user!.name}',
              style: Textstyles.font16boldwithe
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              '${widget.materialmodels.schedule!.lectureHall!.name}',
              style: Textstyles.font16boldwithe
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
          ],
        ),
        Text(
          'Lecture',
          style: Textstyles.font26medinmblue,
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
              onTap: () async {
                var data = await location.getLocation();
                print(" ${data.latitude} ${data.longitude}");
                //  context.read<TakelocationCubit>().getlocationmothed(
                //     latitude: data.latitude.toString(),
                //    longitude: data.longitude.toString(),
                //   session: "lecture");
                // context.read<TakelocationCubit>().updateLocation('New Location'

                String token = await Sharedperfernace.getString('token') ?? '';
                print(" ${data.latitude} ${data.longitude} section");
                var datas = await Apiserverce(Dio()).getloaction(
                    token: token,
                    id: widget.materialmodels.academicScheduleId!,
                    latitude: "30.669295878641602",
                    longitude: "30.070144100553378",
                    session: "lecture");
              },
              child: CircleAvatar(
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
                      style: Textstyles.font16boldwithe
                          .copyWith(color: kprimarykey),
                    ),
                  ],
                ),
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
                  '9:00 AM',
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
                  '9:00 AM',
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
