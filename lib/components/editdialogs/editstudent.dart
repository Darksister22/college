import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlists.dart';
import 'package:college/components/widgets.dart';
import 'package:college/screens/averages.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditStudent extends StatefulWidget {
  final dynamic data;
  const EditStudent({super.key, this.data});

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  @override
  Widget build(BuildContext context) {
    String selYear = translateYearEA(widget.data['year']);
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
                    SelectLevels(selYear: selYear, edit: edit),
                    sizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0),
                    input(context, "اسم الطالب",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: edit,
                        controller: nameAr,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "Student's Name",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: edit,
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
            iconLabelButton(() {
              showDialog(
                context: context,
                builder: (context) {
                  return Averages(data: widget.data);
                },
              );
            }, "عرض معدلات الطالب", FontAwesomeIcons.calculator),
            iconLabelButton(() {
              setState(() => edit = !edit);
            }, "تعديل المعلومات", FontAwesomeIcons.userPen),
            iconLabelButton(
                () {}, "اضافة الطالب الى مادة", FontAwesomeIcons.userPlus),
            iconLabelButton(() async {
              await ApiPosts().removeStudent(
                  context, widget.data['id'].toString(), showSnackBar);
            }, "قطع العلاقة", FontAwesomeIcons.userXmark),
            iconLabelButton(() async {
              await ApiPosts().destroy(context, widget.data['id'].toString(),
                  showSnackBar, "students", "/studenttable");
            }, "حذف الطالب", FontAwesomeIcons.trashCan),
            iconLabelButton(() async {
              if (formkey.currentState!.validate()) {
                await ApiPosts().editStudent(
                    context,
                    widget.data['id'].toString(),
                    nameAr.text,
                    nameEn.text,
                    translateYearAE(selYear),
                    showSnackBar);
              }
            }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
