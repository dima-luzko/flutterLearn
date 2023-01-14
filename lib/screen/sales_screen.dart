import 'package:flutter/material.dart';
import '../user_model.dart';

class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key, required this.userModel}) : super(key: key);

  final User userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("userEmail: ${userModel.email}"),
          Text("userPassword: ${userModel.password}"),
          Text("userPhoneNumber: ${userModel.phoneNumber}")
        ],
      ),
    ));
  }
}
