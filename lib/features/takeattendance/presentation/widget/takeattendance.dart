import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/assets.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';
import 'package:safe_device/safe_device.dart';

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
   
    super.initState();
  }

  bool isSucess = true;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 70,
        ),
        // Center(
        //   child: Text(
        //     '${widget.materialmodels.schedule!.lectureStartHour!.toString().substring(0, 5)}',
        //     style: Textstyles.font26medinmblue,
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Day: ${widget.materialmodels.schedule!.lectureDay}',
              style: Textstyles.font26medinmblue
                  .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
            ),
          ],
        ),

        Center(
          child: Text(
            ' Name: ${widget.materialmodels.schedule!.doctor!.user!.name}',
            style: Textstyles.font26medinmblue
                .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
          ),
        ),

        Center(
          child: Text(
            'Hall:${widget.materialmodels.schedule!.lectureHall!.name}',
            style: Textstyles.font26medinmblue
                .copyWith(fontWeight: FontWeight.w400, color: kthirdcolorkey),
          ),
        ),
        Center(
          child: Text(
            'Lecture',
            style: Textstyles.font26medinmblue,
          ),
        ),
      const  SizedBox(
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
                // bool isMockLocation = true;
                // isMockLocation = await SafeDevice.isMockLocation;
                // var connectivityResult =
                //     await Connectivity().checkConnectivity();
                // //  var isVpn = connectivityResult == ConnectivityResult.vpn;
                var data = await location.getLocation();

                if (data.isMock!) {
                  String token =
                      await Sharedperfernace.getString('token') ?? '';
                  // var data =await getlocations();
                  var data = await location.getLocation();
                  print(" ${data.latitude} ${data.longitude}");
                  await context.read<TakelocationCubit>().getlocationmothed(
                      id: widget.materialmodels.academicScheduleId!,
                      token: token,
                      latitude: data.latitude
                          .toString(), // "30.669295878641602", // data.latitude.toString(),
                      longitude: data.longitude.toString(),
                      // "30.070144100553378", //data.longitude.toString(),
                      session: "lecture");
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('You use fake loaction')));
                  print("there are fake loaction---------------------------");
                }
              },
              child:const consumerchecklocation(),
            ),
          ),
        ),
      const  SizedBox(
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
                  widget.materialmodels.schedule!.lectureStartHour
                      .toString()
                      .substring(0, 5),
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
                  widget.materialmodels.schedule!.lectureEndHour
                      .toString()
                      .substring(0, 5),
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

  Future<LocationData> getlocations() async {
    var datav = await SafeDevice.isMockLocation;
    var isactive = await location.serviceEnabled();
    if (!isactive && !datav) {
      isactive = await location.requestService();
      if (!isactive) {}
    }
    getpremission();
    var data = await location.getLocation();
    return data;
  }

  void getpremission() async {
    var isactive = await location.hasPermission();
    if (isactive == PermissionStatus.denied) {
      isactive = await location.requestPermission();
      if (isactive != PermissionStatus.granted) {}
    }
  }
}

class consumerchecklocation extends StatefulWidget {
  const consumerchecklocation({
    super.key,
  });

  @override
  State<consumerchecklocation> createState() => _consumerchecklocationState();
}

class _consumerchecklocationState extends State<consumerchecklocation> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakelocationCubit, TakelocationState>(
      listener: (context, state) {
        if (state is TakelocationSucess) {
          isloading = false;

          ScaffoldMessenger.of(context).showSnackBar(
            const  SnackBar(content: Text('the doctor take your attandance')));
        } else if (state is Takelocationloading) {
          isloading = true;
        } else if (state is TakelocationalrdayRegister) {
          isloading = false;

          ScaffoldMessenger.of(context).showSnackBar(
           const   SnackBar(content: Text('This Lecture is already is register')));
        } else if (state is Takelocationoutthecollege) {
          isloading = false;

          ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('You are not in the college')));
        } else if (state is TakelocationFailure) {
          isloading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.emassage)));
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
              const  SizedBox(
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
                const SizedBox(
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
              const  SizedBox(
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
               const SizedBox(
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
                const  SizedBox(
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
