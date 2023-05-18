import 'package:college/API/queries.dart';
import 'package:college/components/customlogin.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/snackbar.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormState>();
    double height = MediaQuery.of(context).size.height;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    void showSnackbar(String message, {bool isError = false}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : Colors.green,
        ),
      );
    } //TODO: Maybe change its location since it's gonna be used elsewhere, i'm 100% sure.

    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: Size(width, (width * 0.5).toDouble()),
            painter: RPSCustomPainter(),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: width / 2,
              height: height / 2.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  )
                ],
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        onSecondaryContainer(context,
                            "نظام اللجنة الامتحانية - جامعة النهرين", 25),
                        sizedBox(height: 60.0),
                        input(context, "البريد الالكتروني",
                            icon: const FaIcon(FontAwesomeIcons.user),
                            valiator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'الرجاء ادخال البريد الالكتروني';
                          }
                          return null;
                        }, controller: email),
                        sizedBox(height: 10.0),
                        input(context, "كلمة السر", password: true,
                            valiator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'الرجاء ادخال كلمة السر';
                          }
                          return null;
                        },
                            icon: const FaIcon(FontAwesomeIcons.key),
                            controller: password),
                        sizedBox(height: 30.0),
                        Expanded(
                          child: Row(
                            children: [
                              hotElevatedButton(() async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await ApiPosts().login(context, email.text,
                                        password.text, showSnackbar);
                                  } catch (e) {
                                    context.showSnackBar(
                                        ".حدث خطأ ما, يرجى اعادة المحاولة لاحقاً",
                                        isError: true);
                                  }
                                }
                              }, "تسجيل الدخول"),
                              sizedBox(width: 38.0),
                              hotElevatedButton(() {
                                Navigator.pushReplacementNamed(
                                    context, "/home");
                                context.showSnackBar(
                                    "تم تسجيل الدخول كضيف - سيمكنك قراءة البيانات فقط.");
                              }, "الدخول كضيف"),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
