import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_getx/controllers/add_student_controller.dart';
import 'package:student_management_getx/core/colors.dart';
import 'package:student_management_getx/database/database.dart';
import 'package:student_management_getx/model/model.dart';
import 'package:student_management_getx/widgets/text_field.dart';
import 'package:student_management_getx/widgets/widget.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  AddStudent({super.key});

  final AddStudentController controller = Get.put(AddStudentController());
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final schoolnameController = TextEditingController();
  final phoneController = TextEditingController();
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("ADD STUDENT"),
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Obx(
                      () => controller.profileimgpath.isNotEmpty
                          ? Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: FileImage(
                                      File(controller.profileimgpath.value)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.cyan.shade300),
                              child: const Icon(Icons.add_a_photo),
                            ),
                    ),
                  ),
                  khight,
                  buildTextField(
                    hint: "Name",
                    controller: nameController,
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
                    controller: schoolnameController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) => controller.updateSchool(value),
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
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => controller.updateage(int.parse(value)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an age';
                      }
                     else if (int.tryParse(value) == null||value.length>2||int.parse(value)==0) {
                        return 'Please enter a valid age';
                      }
                      return null;
                    },
                  ),
                  khight,
                  buildTextField(
                    hint: 'Phone',
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    onChanged: (value) => controller.updatePhone(int.parse(value)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (value.length != 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  khight,
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final name = controller.name.value;
                        final school = controller.school.value;
                        final age = controller.age.value;
                        final phone = controller.phone.value;
                        final student = Student(
                          id: 0,
                          name: name,
                          school: school,
                          age: age,
                          phone: phone,
                          profileimg: controller.profileimgpath.value,
                        );
                        controller.clearImage();
                        databaseHelper.insertStudent(student).then((id) {
                          if (id > 0) {
                            Get.back();
                            controller.saveStudent();
                          }
                        });
                      }
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SAVE"),
                        kwidth2,
                        Icon(Icons.save),
                      ],
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

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      controller.updateProfileImg(image.path);
    }
  }

 
}
