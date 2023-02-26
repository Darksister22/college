import 'package:college/components/customlogin.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';

import '../API/apiconfig.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    onSecondaryContainer(
                        context, "نظام اللجنة الامتحانية - جامعة النهرين", 25),
                    sizedBox(height: 60.0),
                    input(context, "اسم المستخدم"),
                    sizedBox(height: 10.0),
                    input(context, "كلمة السر", password: true),
                    sizedBox(height: 30.0),
                    Row(
                      children: [
                        hotElevatedButton(() async {
                          var response = await Api().dio.get("repos");
                          List<dynamic> rows = response.data as List;
                          print(rows);
                        }, "تسجيل الدخول"),
                        sizedBox(width: 38.0),
                        hotElevatedButton(() {
                          Navigator.pushNamed(context, "/home");
                        }, "الدخول كضيف"),
                      ],
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
