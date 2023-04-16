import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditInstructor extends StatefulWidget {
  final dynamic data;
  const EditInstructor({super.key, this.data});

  @override
  State<EditInstructor> createState() => _EditInstructorState();
}

class _EditInstructorState extends State<EditInstructor> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameAr =
        TextEditingController(text: widget.data['name_ar']);
    TextEditingController nameEn =
        TextEditingController(text: widget.data['name_en']);
    bool edit = false;
    void showSnackBar(String message, {bool isError = false}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : Colors.green,
        ),
      );
    }

    final formkey = GlobalKey<FormState>();
    String? validateInput(String? input) {
      if (input == null || input.isEmpty) {
        return 'الرجاء ادخال اسم التدريسي';
      }
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("عرض و تعديل معلومات التدريسي"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    input(context, "اسم التدريسي",
                        controller: nameAr,
                        enabled: edit,
                        valiator: validateInput,
                        icon: const FaIcon(FontAwesomeIcons.userTie)),
                    sizedBox(
                      height: 20.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    input(context, "Instructor's Name",
                        controller: nameEn,
                        enabled: edit,
                        valiator: validateInput,
                        icon: const FaIcon(FontAwesomeIcons.userTie)),
                  ]),
                ),
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.x)),
            iconLabelButton(() {
              setState(() => edit = !edit);
            }, "تعديل المعلومات", FontAwesomeIcons.userPen),
            Visibility(
              visible: edit,
              child: iconLabelButton(() async {
                await ApiPosts().destroy(context, widget.data['id'].toString(),
                    showSnackBar, "instructors", "/instructortable");
              }, "حذف التدريسي", FontAwesomeIcons.trashCan),
            ),
            Visibility(
              visible: edit,
              child: iconLabelButton(() async {
                if (formkey.currentState!.validate()) {
                  await ApiPosts().editInstructor(
                      context,
                      widget.data['id'].toString(),
                      nameAr.text,
                      nameEn.text,
                      showSnackBar);
                }
              }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk),
            )
          ],
        );
      },
    );
  }
}
