import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:project_greduation/core/gorouter.dart';
import 'package:project_greduation/core/utils/server_loaction.dart';
import 'package:project_greduation/features/Auth/presentation/manager/cubit/auths_cubit.dart';
import 'package:project_greduation/features/takeattendance/presentation/manger/cubit/takelocation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //  await Sharedperfernace.setString('token', 'token');
  int num = 0;
  setupO();
  print(DateTime(2025, 3, num).toString());
  runApp(const PorjectGreduation());
}

class PorjectGreduation extends StatelessWidget {
  const PorjectGreduation({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthsCubit(),
        ),
        BlocProvider<TakelocationCubit>(
          create: (context) => TakelocationCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: Gorouter.router,
        theme: ThemeData(fontFamily: 'Inter'),
      ),
    );
  }
}
