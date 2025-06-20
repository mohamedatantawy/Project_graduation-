import 'package:project_greduation/features/Auth/data/models/user/user.dart';
import 'package:project_greduation/features/home/data/models/material/materialmodel.dart';

class Detailsmodels {
  final Materialmodels materialmodels;
  final Usermodels user;
  int? number;
  Detailsmodels(
      {this.number, required this.materialmodels, required this.user});
}
