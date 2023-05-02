import 'package:college/components/adddialogs/yeardi.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LevelMenu extends StatefulWidget {
  const LevelMenu({super.key});

  @override
  State<LevelMenu> createState() => _LevelMenuState();
}

class _LevelMenuState extends State<LevelMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dashboard(
      selectedRoute: '/levelmenu',
      title: "المراحل الدراسية",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height: 30.0),
              Row(
                children: [
                  mainSurface(context, "الرجاء اختيار المرحلة لعرض معلوماتها"),
                  const Spacer(),
                  sizedBox(width: 40.0)
                ],
              ),
              sizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(context, width / 3, height / 7,
                      const FaIcon(FontAwesomeIcons.one), "المرحلة الاولى", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "first",
                            ));
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.two),
                      "المرحلة الثانية", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "second",
                            ));
                  }),
                ],
              ),
              sizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.three),
                      "المرحلة الثالثة", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "third",
                            ));
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.four),
                      "المرحلة الرابعة", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "fourth",
                            ));
                  }),
                ],
              ),
              sizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.book),
                      " الماجستير التحضيري", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "first",
                            ));
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 7,
                      const FaIcon(FontAwesomeIcons.graduationCap),
                      "الدكتوراة التحضيري", () {
                    showDialog(
                        context: context,
                        builder: (context) => const SelectYear(
                              level: "first",
                            ));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
