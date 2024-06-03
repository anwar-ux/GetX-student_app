import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controllers/student_edit_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/database/database.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/screens/edit/update_button.dart';
import 'package:student_management_getx/widgets/text_field.dart';
import 'package:student_management_getx/widgets/widget.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  final Student student;
  EditStudent({super.key, required this.student});

  final StudentEditController controller = Get.put(StudentEditController());

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper databaseHelper = DatabaseHelper();
    controller.initializeData(student);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("EDIT STUDENT"),
        centerTitle: true,
        titleTextStyle: titleStyle,
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(35), child: SizedBox()),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: maincolor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GetBuilder<StudentEditController>(
              builder: (controller) {
                return Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Obx(() => Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: controller.profileimagpath.isNotEmpty
                                      ? FileImage(File(
                                          controller.profileimagpath.value))
                                      : student.profileimg.isNotEmpty
                                          ? FileImage(File(student.profileimg))
                                          : const NetworkImage(
                                              "https://banner2.cleanpng.com/20180802/gyc/kisspng-computer-icons-shape-user-person-scalable-vector-g-imag-icons-3-617-free-vector-icons-page-4-5b62ba06c36336.0063904315331968068003.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      ),
                      khight,
                      buildTextField(
                        hint: "Name",
                        controller: controller.nameController,
                        keyboardType: TextInputType.name,
                        onChanged: (value) => controller.updateName(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      khight,
                      buildTextField(
                        hint: "School",
                        controller: controller.schoolNameController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) =>
                            controller.updateSchoolName(value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a school name';
                          }
                          return null;
                        },
                      ),
                      khight,
                      buildTextField(
                        hint: "Age",
                        controller: controller.ageController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            controller.updateAge(int.parse(value)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an age';
                          }
                          if (int.tryParse(value) == null||value.length>2||int.parse(value)==0) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                      ),
                      khight,
                      buildTextField(
                        hint: 'Phone',
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value) =>
                            controller.updatePhone(int.parse(value)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a phone number';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      khight,
                      Update_button(student: student, databaseHelper: databaseHelper),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfilePicturePath(image.path);
    }
  }

}

