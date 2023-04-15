import 'package:college/API/dynamictable.dart';
import 'package:college/components/editdialogs/editstudent.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MasterSheetTable extends StatefulWidget {
  const MasterSheetTable({super.key});

  @override
  State<MasterSheetTable> createState() => _MasterSheetTableState();
}

class _MasterSheetTableState extends State<MasterSheetTable> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      selectedRoute: '/levelmenu',
      title: "الماستر شيت للسنة الدراسية 2022-2023",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {},
              label: "",
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
                      dataCell(
                          currentRowData["students"]["name_ar"].toString()),
                      dataCell(currentRowData["courses"]["name_en"].toString()),
                      dataCell(check(currentRowData["final1"])),
                      dataCell(check(currentRowData["final2"])),
                      dataCell(check(currentRowData["final3"])),
                      dataCell(check(currentRowData['approx'])),
                      dataCell(currentRowData['sts'] == null
                          ? "لا يوجد"
                          : translateStsEA(currentRowData['sts'])),
                    ];
                  },
                  uri: "degrees"),
              columns: [
                dataColumn("اسم الطالب", context),
                dataColumn("اسم المادة", context),
                dataColumn("درجة الدور الاول", context),
                dataColumn("درجة الدور الثاني", context),
                dataColumn("درجة الدور الثالث", context),
                dataColumn("التقدير", context),
                dataColumn("الحالة", context),
              ]),
        ),
      ),
    );
  }

  String check(String col) {
    if (col == "null") {
      return "لا يوجد";
    } else {
      return col;
    }
  }
}
