import 'package:college/API/queries.dart';
import 'package:college/components/baseadddialog.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlist.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCourse extends StatefulWidget {
  const AddCourse({super.key});

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  @override
  Widget build(BuildContext context) {
    String selYear = 'السنة الاولى';
    String selIns = "";
    final nameAr = TextEditingController();

    final instructor = TextEditingController();
    final nameEn = TextEditingController();
    final code = TextEditingController();
    final success = TextEditingController(text: "50");
    final unit = TextEditingController();
    bool isCounts = true;
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
        return 'الرجاء عدم ترك الحقل فارغاً';
      }
      return null;
    }

    return BaseAddDialog(
        formKey: formkey,
        title: "اضافة كورس جديد",
        func: () async {
          if (formkey.currentState!.validate()) {
            await ApiPosts().createCourse(
                context,
                nameAr.text,
                nameEn.text,
                selYear,
                success.text,
                code.text,
                selIns,
                unit.text,
                isCounts,
                showSnackBar);
          }
        },
        label: "اضافة",
        icon: FontAwesomeIcons.plus,
        children: [
          SelectList(
              type: 1,
              selection: selYear,
              onSelectionChanged: (newValue) {
                setState(() {
                  selYear = newValue;
                });
              },
              label: "السنة الدراسية"),
          sizedBox(
              width: MediaQuery.of(context).size.width * 0.8, height: 20.0),
          input(context, "اسم الكورس",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: nameAr,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "Course Name",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: nameEn,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "درجة النجاح",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: success,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "الوحدة",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: unit,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "كود المادة",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: code,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "اسم التدريسي",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: instructor,
              valiator: validateInput),
          sizedBox(height: 20.0),
          Row(children: [
            Row(children: [
              Checkbox(
                  value: isCounts,
                  onChanged: (value) {
                    setState(() {
                      isCounts = value!;
                    });
                  }),
              Checkbox(
                  value: isCounts,
                  onChanged: (value) {
                    setState(() {
                      isCounts = value ?? false;
                    });
                  }),
              const Text('المادة تشمل في حساب المعدل'),
            ])
          ])
        ]);
  }
}
