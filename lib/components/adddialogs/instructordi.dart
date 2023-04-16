import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddInstructor extends StatelessWidget {
  const AddInstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameAr = TextEditingController();
    TextEditingController nameEn = TextEditingController();
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
          title: const Text("اضافة تدريسي جديد"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    input(context, "اسم التدريسي",
                        controller: nameAr,
                        valiator: validateInput,
                        icon: const FaIcon(FontAwesomeIcons.userTie)),
                    sizedBox(
                      height: 20.0,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    input(context, "Instructor's Name",
                        controller: nameEn,
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
                icon: const FaIcon(FontAwesomeIcons.x, size: 10)),
            iconLabelButton(() async {
              if (formkey.currentState!.validate()) {
                await ApiPosts()
                    .createInstructor(nameAr.text, nameEn.text, showSnackBar);
              }
            }, "اضافة", FontAwesomeIcons.userPlus)
          ],
        );
      },
    );
  }
}
