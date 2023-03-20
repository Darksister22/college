import 'package:college/API/dynamictable.dart';
import 'package:college/components/dialogues/studentdi.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InstructorTable extends StatefulWidget {
  const InstructorTable({super.key});

  @override
  State<InstructorTable> createState() => _InstructorTableState();
}

class _InstructorTableState extends State<InstructorTable> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dashboard(
      selectedRoute: '/instructortable',
      title: "معلومات التدريسيين",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      const DataCell(FaIcon(FontAwesomeIcons.pen)),
                      dataCell(currentRowData["name_ar"].toString()),
                      dataCell(currentRowData["name_en"].toString()),
                    ];
                  },
                  uri: "/api/instructors"),
              columns: [
                dataColumn("تعديل", context),
                dataColumn("اسم التدريسي", context),
                dataColumn("Instructor's Name", context),
              ]),
        ),
      ),
    );
  }
}
