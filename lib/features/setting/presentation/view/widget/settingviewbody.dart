import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/core/utils/api/Apiserverce.dart';
import 'package:project_greduation/core/utils/customelevatedbutton.dart';
import 'package:project_greduation/core/utils/sharedperfernace.dart';
import 'package:project_greduation/features/setting/presentation/models/settingmodel.dart';

class Settingviewbody extends StatelessWidget {
  const Settingviewbody({super.key, required this.token});
  final List<Settingmodel> setting = const [
    Settingmodel(
        title: 'Privacy & Permission', icons: Icons.privacy_tip_outlined),
    Settingmodel(title: 'Data & Storage', icons: Icons.storage),
  ];
  final List<Settingmodel> more = const [
    Settingmodel(title: 'Help', icons: Icons.help_outline),
    Settingmodel(title: 'Feedback', icons: Icons.feedback_outlined),
    Settingmodel(title: 'About', icons: Icons.info_outline),
    Settingmodel(title: 'Invite a Friend', icons: Icons.forward),
  ];
  final String token;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'App Settings',
                style: Textstyles.font14medinmblue,
              ),
              Column(
                children: List.generate(
                  2,
                  (index) {
                    return ListTile(
                      leading: Icon(
                        setting[index].icons,
                        color: kbluesetting,
                      ),
                      title: Text(
                        setting[index].title,
                        style: Textstyles.font16medinmbluesetting,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More',
                style: Textstyles.font14medinmblue,
              ),
              Column(
                children: List.generate(
                  4,
                  (index) {
                    return ListTile(
                      leading: Icon(
                        more[index].icons,
                        color: kbluesetting,
                      ),
                      title: Text(
                        more[index].title,
                        style: Textstyles.font16medinmbluesetting,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: Customelevatedbutton(
              title: 'Logout',
              onpressed: () async {
                bool datas = await Apiserverce(Dio()).logout(token: token);
                await Sharedperfernace.setbool('isremid', false);
                print(datas.toString());
                if (datas == true) {
                  GoRouter.of(context).pushReplacement(Gorouter.klogin);
                } else {
                  print('dont logout ');
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
