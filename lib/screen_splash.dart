import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:student_management_getx/controllers/login_controller.dart';
import 'package:student_management_getx/core/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: GetBuilder<LoginController>(
          builder: (controller) {
            // Use the controller here
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'STUDENT MANAGEMENT',
                  style: GoogleFonts.dancingScript(
                      color: Colors.blueGrey.shade700,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Lottie.asset(
                  'Assets/Animation - 1717150533980.json',
                  width: 270,
                  height: 270,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}