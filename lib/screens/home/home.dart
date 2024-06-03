import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/controllers/home_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/screens/adding/add_student.dart';
import 'package:student_management_getx/screens/details/details.dart';
import 'package:student_management_getx/widgets/widget.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color1,
        title: const Text("STUDENTS LIST"),
        titleTextStyle: titleStyle,
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CupertinoSearchTextField(
              onChanged: (value) {
                controller.filterStudents(value);
              },
              backgroundColor: Colors.cyan.shade100,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: Obx(() {
          if (controller.filterdStudents.isEmpty) {
            return const Center(
              child: Text(
                'No students found',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.filterdStudents.length,
            itemBuilder: (context, index) {
              final student = controller.filterdStudents[index];
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () => Get.to(() => StudentDetails(student: student)),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(237, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        leading: student.profileimg.isNotEmpty
                            ? Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(File(student.profileimg)),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )
                            : Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                        title: Text(
                          student.name,
                          style:  GoogleFonts.crimsonPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueGrey,
                          ),
                        ),
                        subtitle: Text(
                          student.school,
                          style:  GoogleFonts.crimsonPro(
                            fontSize: 16,
                            color: Colors.blueGrey,
                          ),
                        ),
                        trailing: Text(
                          "Age: ${student.age}",
                          style: GoogleFonts.crimsonPro(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        ),
                        minTileHeight: 60,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color1,
        onPressed: () {
        Get.to(AddStudent())!
              .then((value) => controller.refreshStudentList());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
