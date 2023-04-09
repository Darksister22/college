import 'package:college/API/dynamictable.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseDegreeTable extends StatefulWidget {
  final dynamic data;
  const CourseDegreeTable({super.key, required this.data});

  @override
  State<CourseDegreeTable> createState() => _CourseDegreeTableState();
}

class _CourseDegreeTableState extends State<CourseDegreeTable> {
  @override
  Widget build(BuildContext context) {
    int id = widget.data['id'];
    return Dashboard(
      selectedRoute: '/levelmenu',
      title: widget.data['name_en'],
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {},
              label: "عرض سعيات المادة",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    if (currentRowData == null) {}
                    return [
                      dataCell(
                          currentRowData['students'][0]["name_ar"].toString()),
                      dataCell(
                          currentRowData['students'][0]["name_ar"].toString()),
                      dataCell(
                          currentRowData['students'][0]["name_en"].toString()),
                      dataCell(translateYearEA(
                          currentRowData["students"][0]["year"])),
                    ];
                  },
                  uri: "courses/students/$id"),
              columns: [
                dataColumn("عرض المعلومات", context),
                dataColumn("اسم الطالب", context),
                dataColumn("Student's Name", context),
                dataColumn("السنة الدراسية", context),
              ]),
        ),
      ),
    );
  }
}
