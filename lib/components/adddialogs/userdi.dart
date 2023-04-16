import 'package:college/API/queries.dart';
import 'package:college/components/baseadddialog.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/selectlists.dart';
import 'package:college/components/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddUser extends StatelessWidget {
  const AddUser({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    String selRole = 'عضو - قراءة و تعديل';
    TextEditingController password = TextEditingController();
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
            await ApiPosts().createUser(context, name.text, email.text, selRole,
                password.text, showSnackBar);
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
          SelectRole(selRole: selRole)
        ]);
  }
}
