import 'package:college/API/dynamictable.dart';
import 'package:college/components/dialogues/studentdi.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/text.dart';
import 'package:college/components/widgets.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Dashboard(
      selectedRoute: '/studentmenu',
      title: "معلومات الطلبة",
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
                      dataCell(currentRowData["year"].toString()),
                    ];
                  },
                  uri: "/api/students"),
              columns: [
                dataColumn("تعديل", context),
                dataColumn("اسم الطالب", context),
                dataColumn("Student's Name", context),
                dataColumn("Year", context),
              ]),
        ),
      ),
    );
  }
}

DataCell dataCell(text, {direction, color}) {
  return DataCell(rowText(text, direction: direction, color: color));
}

DataColumn dataColumn(text, context, {numeric = false}) {
  return DataColumn(label: colText(text, context), numeric: numeric);
}

Text rowText(text, {direction, color}) {
  return Text(
    text,
    textDirection: direction,
    style: TextStyle(fontSize: 20, color: color),
  );
}

Text colText(text, context) {
  return Text(
    text,
    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
  );
}
