import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Widgets/app_elevated_button.dart';
import 'package:flutter_nti_task/Widgets/app_text_field.dart';
import 'package:flutter_nti_task/Widgets/have_account.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "LoginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 270,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                "lib/assets/image/PalestineFlag.png",
                // width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Colors.green)),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      hintText: "Enter Username",
                      labelText: "Username",
                      controller: usernameController,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid username!';
                        }
                        return null;
                      },
                      prefixIcon: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      hintText: "Enter Password",
                      labelText: "Password",
                      controller: passwordController,
                      obscureText: obscureText,
                      prefixIcon: Icon(Icons.vpn_key),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        child: Icon(obscureText
                            ? Icons.lock_outlined
                            : Icons.lock_open_outlined),
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppElevatedButton(
                      buttonText: "Login",
                      textStyle: TextStyle(fontSize: 20, color: Colors.white),
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        print(usernameController.text);
                        print(passwordController.text);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    HaveAccount(
                        text: "Don’t Have An Account?", buttonText: "Register")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
