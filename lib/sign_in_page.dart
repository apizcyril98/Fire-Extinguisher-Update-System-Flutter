import 'package:flutter/material.dart';
import 'package:utm_fire_extinguisher_scanner/widgets/palatte.dart';
import '../widgets/widgets.dart';
import 'package:utm_fire_extinguisher_scanner/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:utm_fire_extinguisher_scanner/FadeAnimation.dart';


class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
             body: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        height: 250,
                        child: Center(
                          child: FadeAnimation(1, Text("SKE Extinguisher Updater", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                          ),
                        ),

                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),

                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextField(
                                  autofocus: false,
                                  style: TextStyle(fontSize: 19.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Email Address',
                                    contentPadding:
                                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                  controller: emailController,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                TextField(
                                  obscureText: true,
                                  autofocus: false,
                                  style: TextStyle(fontSize: 19.0, color: Colors.black),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Password',
                                    contentPadding:
                                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                    focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(25.7),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(25.7),
                                    ),
                                  ),
                                  controller: passwordController,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    onPrimary: Colors.white),
                                  onPressed: () {
                                    context.read<AuthenticationService>().signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                  },
                                  child: Text("Sign In"),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ),
          ),
      ],
    );
  }
}