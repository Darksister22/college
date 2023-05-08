import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditDegree extends StatefulWidget {
  final dynamic data;
  const EditDegree({super.key, this.data});

  @override
  State<EditDegree> createState() => _EditDegreeState();
}

class _EditDegreeState extends State<EditDegree> {
  late TextEditingController nameAr;
  late TextEditingController fourty;
  late TextEditingController sixty1;
  late TextEditingController sixty2;
  late TextEditingController sixty3;

  late bool edit;
  @override
  void initState() {
    nameAr = TextEditingController(text: widget.data['student']['name_ar']);
    fourty = TextEditingController(text: widget.data['fourty']);
    sixty1 = TextEditingController(text: widget.data['sixty1']);
    sixty2 = TextEditingController(text: widget.data['sixty2']);
    sixty3 = TextEditingController(text: widget.data['sixty3']);
    edit = false;
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
        return 'الرجاء عدم ترك الحقل فارغاً';
      }
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("عرض و تعديل درجات الطالب"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    sizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0),
                    input(context, "اسم الطالب",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: false,
                        controller: nameAr,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "السعي",
                        icon: const FaIcon(FontAwesomeIcons.calculator),
                        enabled: edit,
                        controller: fourty,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "درجة الامتحان د1",
                        icon: const FaIcon(FontAwesomeIcons.calculator),
                        enabled: edit,
                        controller: sixty1,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "درجة الامتحان د2",
                        icon: const FaIcon(FontAwesomeIcons.calculator),
                        enabled: edit,
                        controller: sixty2,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(context, "درجة الامتحان د3",
                        icon: const FaIcon(FontAwesomeIcons.calculator),
                        enabled: edit,
                        controller: sixty3,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
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
            iconLabelButton(() async {
              if (formkey.currentState!.validate()) {
                await ApiPosts().createDegree(
                    context,
                    widget.data['id'],
                    fourty.text,
                    sixty1.text,
                    sixty2.text,
                    sixty3.text,
                    showSnackBar);
              }
            }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
