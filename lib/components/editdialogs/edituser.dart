import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlist.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditUser extends StatefulWidget {
  final dynamic data;
  const EditUser({super.key, this.data});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  String selRole = 'عضو - قراءة و تعديل';
  bool edit = false;

  @override
  void initState() {
    super.initState();
    selRole = translateYearEA(widget.data['role']);
    name = TextEditingController(text: widget.data['name']);
    email = TextEditingController(text: widget.data['email']);
    password = TextEditingController(text: widget.data['password']);
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
        return 'الرجاء عدم ترك الحقل فارغاً. ';
      }
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("عرض و تعديل معلومات المستخدم"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    sizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0),
                    input(context, "اسم المستخدم",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: edit,
                        controller: name,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "البريد الالكتروني",
                      icon: const FaIcon(FontAwesomeIcons.user),
                      enabled: edit,
                      controller: email,
                      valiator: (value) => EmailValidator.validate(value!)
                          ? null
                          : "البريد الالكتروني غير صحيح",
                    ),
                    sizedBox(height: 20.0),
                    input(context, "كلمة السر",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: edit,
                        password: true,
                        controller: password,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    SelectList(
                        type: 2,
                        selection: selRole,
                        onSelectionChanged: (newValue) {
                          setState(() {
                            selRole = newValue;
                          });
                        },
                        label: "الصلاحيات")
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
              await ApiPosts().destroy(context, widget.data['id'].toString(),
                  showSnackBar, "users", "/usertable");
            }, "حذف المستخدم", FontAwesomeIcons.trashCan),
            iconLabelButton(() async {
              if (formkey.currentState!.validate()) {}
            }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
