import 'package:college/API/dynamictable.dart';
import 'package:college/components/editdialogs/editgrads.dart';
import 'package:college/components/editdialogs/editinstuctor.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GraduateTable extends StatefulWidget {
  const GraduateTable({super.key});

  @override
  State<GraduateTable> createState() => _GraduateTableState();
}

class _GraduateTableState extends State<GraduateTable> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      selectedRoute: '/graduatetable',
      title: "معلومات الخريجين",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {},
              label: "طباعة ملف الخريجين",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      DataCell(IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return EditGraduate(data: currentRowData);
                                });
                          },
                          icon: const FaIcon(FontAwesomeIcons.pen))),
                      dataCell(currentRowData["name_ar"].toString()),
                      dataCell(currentRowData["name_en"].toString()),
                      dataCell(currentRowData["avg1"].toString()),
                      dataCell(currentRowData["avg2"].toString()),
                      dataCell(currentRowData["avg3"].toString()),
                      dataCell(currentRowData["avg4"].toString()),
                      dataCell(currentRowData["avg_final"].toString()),
                      dataCell(currentRowData["summer_deg"].toString()),
                    ];
                  },
                  uri: "grads/show"),
              columns: [
                dataColumn("تعديل المعلومات", context),
                dataColumn("اسم الطالب", context),
                dataColumn("Student's Name", context),
                dataColumn("معدل م1", context),
                dataColumn("معدل م2", context),
                dataColumn("معدل م3", context),
                dataColumn("معدل م4", context),
                dataColumn("المعدل النهائي", context),
                dataColumn("درجة التدريب الصيفي", context),
              ]),
        ),
      ),
    );
  }
}
