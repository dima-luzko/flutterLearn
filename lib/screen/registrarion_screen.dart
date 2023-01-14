import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:practice_app/utils/validator.dart';

import '../user_model.dart';
import 'catalog.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool _showPassword = false;

  var maskFormatter = MaskTextInputFormatter(
      mask: '+# (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void _submit() {
    if (_emailKey.currentState!.validate() &&
        _passwordKey.currentState!.validate() &&
        _phoneKey.currentState!.validate()) {

      final User user = User(emailController.text, passwordController.text,
          maskFormatter.getMaskedText());

      // Map<String, dynamic> userData = {
      //   "Email": emailController.text,
      //   "Password": passwordController.text,
      //   "Phone": maskFormatter.getMaskedText()
      // };

      print("validate, data: ${user}");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeWidget(userData: user)));
    } else {
      print("no_valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: size.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SizedBox(height: size.height * 0.03),
                  Form(
                    key: _emailKey,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) =>
                            Validator.validateEmail(value ?? ""),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Form(
                      key: _passwordKey,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          obscureText: _showPassword,
                          validator: (value) =>
                              Validator.validatePassword(value ?? ""),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: size.height * 0.03),
                  Form(
                    key: _phoneKey,
                    onChanged: () => {_phoneKey.currentState!.validate()},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                        inputFormatters: [maskFormatter],
                        controller: phoneController,
                        decoration: InputDecoration(
                            hintText: "Phone number",
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        keyboardType: TextInputType.number,
                        validator: (value) =>
                            Validator.validatePhoneNumber(value ?? ""),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.06),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15)),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
