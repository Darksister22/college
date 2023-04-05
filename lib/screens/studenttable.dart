import 'package:college/API/dynamictable.dart';
import 'package:college/components/adddialogs/studentdi.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentTable extends StatefulWidget {
  const StudentTable({super.key});

  @override
  State<StudentTable> createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      selectedRoute: '/studentmenu',
      title: "معلومات الطلبة",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AddStudent();
                  },
                );
              },
              label: "اضافة طالب جديد",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      const DataCell(FaIcon(FontAwesomeIcons.pen)),
                      dataCell(currentRowData["name_ar"].toString()),
                      dataCell(currentRowData["name_en"].toString()),
                      dataCell(
                          translateYearEA(currentRowData["year"].toString())),
                    ];
                  },
                  uri: "students"),
              columns: [
                dataColumn("تعديل المعلومات", context),
                dataColumn("اسم الطالب", context),
                dataColumn("Student's Name", context),
                dataColumn("Year", context),
              ]),
        ),
      ),
    );
  }
}
