import 'package:college/API/dynamictable.dart';
import 'package:college/components/adddialogs/studentdi.dart';
import 'package:college/components/editdialogs/editstudent.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StudentTable extends StatefulWidget {
  final dynamic year;

  const StudentTable({super.key, required this.year});

  @override
  State<StudentTable> createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  @override
  Widget build(BuildContext context) {
    String yearnum = widget.year.toString();
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
                      DataCell(IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return EditStudent(data: currentRowData);
                                });
                          },
                          icon: const FaIcon(FontAwesomeIcons.pen))),
                      dataCell(currentRowData["name_ar"].toString()),
                      dataCell(currentRowData["name_en"].toString()),
                      dataCell(
                          translateYearEA(currentRowData["year"].toString())),
                    ];
                  },
                  uri: "students/$yearnum"),
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
