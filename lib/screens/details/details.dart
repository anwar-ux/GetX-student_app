import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/controllers/student_details_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/details/button_widget.dart';
import 'package:student_management_getx/screens/details/image_Widget.dart';
import 'package:student_management_getx/widgets/widget.dart';

class StudentDetails extends StatelessWidget {
  final Student student;
  StudentDetails({super.key, required this.student});

  final controller = Get.put(StudentDetailsController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("STUDENT DETAILS"),
        titleTextStyle: titleStyle,
        backgroundColor: color1,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: maincolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                khight,
                ImageWidget(student: student),
                khight1,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 320,
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(156, 0, 0, 0),
                            blurRadius: 20,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${student.name}",
                              style: styledetails(),
                            ),
                            Text(
                              "School: ${student.school}",
                              style: styledetails(),
                            ),
                            Text(
                              "Age: ${student.age}",
                              style: styledetails(),
                            ),
                            Text(
                              "Phone: ${student.phone}",
                              style: styledetails(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                khight1,
                ButtonWidget(controller: controller, student: student),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle styledetails() => GoogleFonts.crimsonPro(
        fontSize: 26,
        color: Colors.blueGrey.shade500,
        fontWeight: FontWeight.w600,
      );
}
