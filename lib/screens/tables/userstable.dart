import 'package:college/API/dynamictable.dart';
import 'package:college/components/adddialogs/userdi.dart';
import 'package:college/components/editdialogs/edituser.dart';
import 'package:college/screens/dashboard.dart';
import 'package:college/components/widgets.dart';
import 'package:college/translate.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserTable extends StatefulWidget {
  const UserTable({super.key});

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  @override
  Widget build(BuildContext context) {
    return Dashboard(
      selectedRoute: '/',
      title: "معلومات المستخدمين",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: DynamicTable(
              add: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AddUser();
                    });
              },
              label: "اضافة مستخدم جديد",
              source: DynamicDataTableSource(
                  cells: (currentRowData) {
                    return [
                      DataCell(IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return EditUser(data: currentRowData);
                                });
                          },
                          icon: const FaIcon(FontAwesomeIcons.pen))),
                      dataCell(currentRowData["name"].toString()),
                      dataCell(currentRowData["email"].toString()),
                      dataCell(
                          translateRoleEA(currentRowData["role"].toString()))
                    ];
                  },
                  uri: "users/get"),
              columns: [
                dataColumn("تعديل المعلومات", context),
                dataColumn("اسم المستخدم", context),
                dataColumn("البريد الالكتروني", context),
                dataColumn("الصلاحيات", context),
              ]),
        ),
      ),
    );
  }
}
