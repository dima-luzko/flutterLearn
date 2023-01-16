import 'package:flutter/material.dart';

import '../presentation/screens/registrarion_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: RegisterScreen()
    );
  }
}