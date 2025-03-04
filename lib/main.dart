import 'package:flutter/material.dart';
import 'package:project_greduation/core/gorouter.dart';

void main() {
  runApp(const PorjectGreduation());
}

class PorjectGreduation extends StatelessWidget {
  const PorjectGreduation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Gorouter.router,
      theme: ThemeData(fontFamily: 'Inter'),
    );
  }
}
