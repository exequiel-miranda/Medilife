import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/constants/asset_paths.dart';
import 'package:untitled/controllers/appController.dart';
import 'package:untitled/screens/authentication/widgets/bottom_text.dart';
import 'package:untitled/screens/authentication/widgets/login.dart';
import 'package:untitled/screens/authentication/widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.white,

        body: Obx(
      () => SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            //SizedBox(height: MediaQuery.of(context).size.width / 3),
            Image.asset(
              logo, width: 400,
              //fit: BoxFit.cover,
            ),
            SizedBox(height: MediaQuery.of(context).size.width / 5),
            Visibility(
                visible: _appController.isLoginWidgetDisplayed.value,
                child: LoginWidget()),
            Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: RegistrationWidget()),
            SizedBox(
              height: 10,
            ),
            Visibility(
              visible: _appController.isLoginWidgetDisplayed.value,
              child: BottomTextWidget(
                onTap: () {
                  _appController.changeDIsplayedAuthWidget();
                },
                text1: "No tienes cuenta? Registrate!",
                text2: "\n\n        Olvide mi contraseña",
              ),
            ),

/*
            Visibility(
              visible: !_appController.isLoginWidgetDisplayed.value,
              child: BottomTextWidget(
                onTap: () {
                  _appController.changeDIsplayedAuthWidget();
                },
                text1: "Already have an account?",
                text2: "Sign in!!",
              ),
            ),

*/
          ],
        ),
      ),
    ));
  }
}
