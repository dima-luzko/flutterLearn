import 'package:flutter/material.dart';

import 'feature/registration/presentation/registration_screen.dart';


void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flutter Demo',
        home: RegistrationScreen()
    );
  }
}

