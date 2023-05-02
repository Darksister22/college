import 'package:college/API/queries.dart';
import 'package:college/components/baseadddialog.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlist.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;
  String selRole = 'عضو - قراءة و تعديل';
  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
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

    return BaseAddDialog(
        formKey: formkey,
        title: "اضافة مستخدم جديد",
        func: () async {
          if (formkey.currentState!.validate()) {
            await ApiPosts().createUser(context, name.text, email.text,
                translateRoleAE(selRole), password.text, showSnackBar);
          }
        },
        label: "اضافة",
        icon: FontAwesomeIcons.plus,
        children: [
          input(context, "اسم المستخدم",
              controller: name,
              valiator: validateInput,
              icon: const FaIcon(FontAwesomeIcons.userTie)),
          sizedBox(
            height: 20.0,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
          input(context, "البريد الالكتروني",
              controller: email,
              valiator: (value) => EmailValidator.validate(value!)
                  ? null
                  : "البريد الالكتروني غير صحيح",
              icon: const FaIcon(FontAwesomeIcons.userTie)),
          sizedBox(height: 20.0),
          input(context, "كلمة السر",
              controller: password,
              password: true,
              valiator: validateInput,
              icon: const FaIcon(FontAwesomeIcons.key)),
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
        ]);
  }
}
