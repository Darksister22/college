import 'package:college/API/queries.dart';
import 'package:college/components/baseadddialog.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlist.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  late String selYear;
  late TextEditingController nameAr;
  late TextEditingController nameEn;

  @override
  void initState() {
    selYear = 'السنة الاولى';
    nameAr = TextEditingController();
    nameEn = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

    return BaseAddDialog(
        formKey: formkey,
        title: "اضافة طالب جديد",
        func: () async {
          if (formkey.currentState!.validate()) {
            await ApiPosts()
                .createStudent(nameAr.text, nameEn.text, selYear, showSnackBar);
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
          //SelectLevels(selYear: selYear),
          sizedBox(
              width: MediaQuery.of(context).size.width * 0.8, height: 20.0),
          input(context, "اسم الطالب",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: nameAr,
              valiator: validateInput),
          sizedBox(height: 20.0),
          input(context, "Student's Name",
              icon: const FaIcon(FontAwesomeIcons.user),
              controller: nameEn,
              valiator: validateInput),
        ]);
  }
}
