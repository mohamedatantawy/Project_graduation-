import 'package:flutter/material.dart';
import 'package:project_greduation/constants.dart';
import 'package:project_greduation/core/styles/textstyles.dart';
import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/profile/presentation/view/models/profilemodels.dart';

class Profileviewbody extends StatefulWidget {
  const Profileviewbody({super.key, required this.user});
  final Usermodels user;

  @override
  State<Profileviewbody> createState() => _ProfileviewbodyState();
}

class _ProfileviewbodyState extends State<Profileviewbody> {
  final List<Profilemodelstitle> infoprofilestudent = const [
    Profilemodelstitle(
      title: 'Name',
    ),
    Profilemodelstitle(
      title: 'Grade',
    ),
    Profilemodelstitle(
      title: 'Email',
    ),

    Profilemodelstitle(
      title: 'Deparment ( It Found )',
    ),
    Profilemodelstitle(
      title: 'Phone',
    ),
  ];
  final List<Profilemodelstitle> infoprofiledoc = const [
    Profilemodelstitle(
      title: 'Name',
    ),
    Profilemodelstitle(
      title: 'Email',
    ),
    Profilemodelstitle(
      title: 'Deparment ( It Found )',
    ),
    Profilemodelstitle(
      title: 'Phone',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
      ),
      child: ListView(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            '${widget.user.name}',
            textAlign: TextAlign.center,
            style: Textstyles.font22medinmwithe.copyWith(
              color: kthirdcolorkey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            widget.user.email != 'null' ? '${widget.user.email}' : 'notavaible',
            textAlign: TextAlign.center,
            style: Textstyles.font11lightwithe.copyWith(
              color: kthirdcolorkey,
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              widget.user.role == 'student'
                  ? infoprofilestudent.length
                  : infoprofiledoc.length,
              (index) {
                if (widget.user.role == 'student') {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, bottom: 6, top: 16),
                        child: Text(
                          infoprofilestudent[index].title,
                          style: Textstyles.font18boldblue,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kgraycolors,
                        ),
                        child: Text(
                          index == 0
                              ? "${widget.user.name}"
                              : index == 1
                                  ? "${widget.user.student!.grade}"
                                  : index == 2
                                      ? "${widget.user.email}"
                                      
                                          : index == 4
                                              ? "${widget.user.student!.department}"
                                              : "${widget.user.phone}",
                          style: Textstyles.font15extrlightblue,
                        ),
                      )
                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, bottom: 6, top: 16),
                        child: Text(
                          infoprofiledoc[index].title,
                          style: Textstyles.font18boldblue,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kgraycolors,
                        ),
                        child: Text(
                          index == 0
                              ? "${widget.user.name}"
                              : index == 1
                                  ? "${widget.user.email}"
                                  : index == 2
                                      ? widget.user.role == 'doctor'
                                          ? "${widget.user.doctor!.department}"
                                          : "${widget.user.assistant!.department}"
                                      : widget.user.phone == null
                                          ? "${widget.user.phone}"
                                          : 'notavaible',
                          style: Textstyles.font15extrlightblue,
                        ),
                      )
                    ],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
