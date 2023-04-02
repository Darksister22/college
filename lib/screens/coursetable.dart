import 'package:college/API/dynamictable.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseTable extends StatefulWidget {
  const CourseTable({super.key});

  @override
  State<CourseTable> createState() => _CourseTableState();
}

class _CourseTableState extends State<CourseTable> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      selectedRoute: '/levelmenu',
      title: "مواد الكورس الاول",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {},
              label: "اضافة كورس جديد",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      const DataCell(FaIcon(FontAwesomeIcons.eye)),
                      dataCell(currentRowData["name_ar"].toString()),
                      dataCell(currentRowData["name_en"].toString()),
                      dataCell(currentRowData["year"].toString()),
                    ];
                  },
                  uri: "courses"),
              columns: [
                dataColumn("عرض المعلومات", context),
                dataColumn("اسم المادة", context),
                dataColumn("Course Name", context),
                dataColumn("السنة الدراسية", context),
              ]),
        ),
      ),
    );
  }
}
