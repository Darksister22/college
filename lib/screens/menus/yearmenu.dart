import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:college/screens/tables/coursetable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YearMenu extends StatefulWidget {
  final dynamic level;
  const YearMenu({super.key, required this.level});

  @override
  State<YearMenu> createState() => _YearMenuState();
}

class _YearMenuState extends State<YearMenu> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dashboard(
      selectedRoute: '/levelmenu',
      title: "السنة الدراسية 2022 - 2023",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox(height: 30.0),
              Row(
                children: [
                  mainSurface(
                      context, "الرجاء الاختيار لعرض الدرجات او المواد"),
                  const Spacer(),
                ],
              ),
              sizedBox(height: 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttonCard(
                      context,
                      width / 1.4,
                      height / 5,
                      const FaIcon(FontAwesomeIcons.sheetPlastic),
                      "الماستر شيت", () {
                    Navigator.pushNamed(context, "/mastersheet");
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
                      height / 5,
                      const FaIcon(FontAwesomeIcons.book),
                      "مواد الكورس الاول", () {
                    Map<String, dynamic> args = {
                      'title': "مواد الكورس الاول",
                      'level': widget.level,
                      'semester': "first"
                    };

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseTable(
                            semester: "first",
                            level: widget.level,
                            title: "مواد الكورس الاول"),
                      ),
                    );
                  }),
                  buttonCard(
                      context,
                      width / 3,
                      height / 5,
                      const FaIcon(FontAwesomeIcons.book),
                      "مواد الكورس الثاني", () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseTable(
                            semester: "second",
                            level: widget.level,
                            title: "مواد الكورس الثاني"),
                      ),
                    );
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
