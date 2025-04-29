import 'package:flutter/material.dart';
import 'package:project_greduation/core/styles/textstyles.dart';

class Notificationviewbody extends StatelessWidget {
  const Notificationviewbody(
      {super.key, required this.data, required this.keylist});
  final Map<String, dynamic> data;
  final List keylist;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
        
          Column(
              children: List.generate(keylist.length, (index) {
            return showlistileworing(
              datas: data,
              idexs: index,
              keysd: keylist,
            );
          })),
        ],
      ),
    );
  }
}

class showlistileworing extends StatelessWidget {
  const showlistileworing({
    super.key,
    required this.idexs,
    required this.datas,
    required this.keysd,
  });
  final int idexs;
  final Map<String, dynamic> datas;
  final List keysd;
  @override
  Widget build(BuildContext context) {
    int length = (datas['${keysd[idexs]}'] as List?)?.length ?? 0;

    return Column(
      children: List.generate(length, (index) {
        String datetime = datas['${keysd[idexs]}'][index]['updated_at'];
        return ListTile(
          leading: Icon(
            Icons.info_outline,
            size: 30,
          ),
          title: Text(
            datas['${keysd[idexs]}'][index]['warning_content'],
            style: Textstyles.font15extrlightblue,
          ),
          subtitle: Text(
            //['${keysd[idexs]}'][index]['updated_at'].sub
            datetime.substring(0, 10),
            style: Textstyles.font15extrlightblue,
          ),
        );
      }),
    );
  }
}
