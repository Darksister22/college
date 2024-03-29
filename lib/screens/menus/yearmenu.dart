import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:college/screens/tables/coursetable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class YearMenu extends StatefulWidget {
  final dynamic level;
  final dynamic year;
  const YearMenu({super.key, required this.level, required this.year});

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
      title: " السنة الدراسية" + widget.year,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseTable(
                            semester: "first",
                            year: widget.year,
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
                            year: widget.year,
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
