import 'package:college/API/dynamictable.dart';
import 'package:college/API/queries.dart';
import 'package:college/components/editdialogs/editdegrees.dart';
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
              add: () async {
                ApiPosts().callPrintFourty('path', id);
              },
              label: "عرض سعيات المادة",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      DataCell(IconButton(
                        icon: const FaIcon(FontAwesomeIcons.eye),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return EditDegree(data: currentRowData);
                              });
                        },
                      )),
                      dataCell(currentRowData['student']["name_ar"].toString()),
                      dataCell(check(currentRowData['fourty'].toString())),
                      dataCell(check(currentRowData['sixty1'].toString())),
                      dataCell(check(currentRowData['final1'].toString())),
                      dataCell(check(currentRowData['sixty2'].toString())),
                      dataCell(check(currentRowData['final2'].toString())),
                      dataCell(check(currentRowData['sixty3'].toString())),
                      dataCell(check(currentRowData['final3'].toString())),
                      dataCell(
                          translateStsEA(currentRowData['sts'].toString())),
                    ];
                  },
                  uri: "degrees/get/$id"),
              columns: [
                dataColumn("عرض المعلومات", context),
                dataColumn("اسم الطالب", context),
                dataColumn("السعي", context),
                dataColumn("الامتحان د1", context),
                dataColumn("نهائي د1", context),
                dataColumn("الامتحان د2", context),
                dataColumn("نهائي د2", context),
                dataColumn("الامتحان د3", context),
                dataColumn("نهائي د3", context),
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
