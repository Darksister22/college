import 'package:college/components/baseadddialog.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlists.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({super.key});

  @override
  Widget build(BuildContext context) {
    String selYear = 'السنة الاولى';
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
        return 'الرجاء ادخال اسم الطالب';
      }
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("عرض و تعديل معلومات الطالب"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    SelectLevels(selYear: selYear),
                    sizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0),
                    input(context, "اسم الطالب",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        controller: nameAr,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "Student's Name",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        controller: nameEn,
                        valiator: validateInput),
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
            iconLabelButton(() {}, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
