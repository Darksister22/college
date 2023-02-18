import 'package:college/style/sidebar.dart';
import 'package:college/style/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AdminScaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text('نظام اللجنة الامتحانية')),
      sideBar: sideBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            sizedBox(height: 30.0),
            Text(
              "مرحباً بك في نظام اللجنة الامتحانية لقسم هندسة الحاسوب - جامعة النهرين",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            sizedBox(height: 30.0),
            primaryContainer(context, width, height / 5, Text("data1")),
            sizedBox(height: 20.0),
            primaryContainer(context, width, height / 5, Text("data2"))
          ]),
        ),
      ),
    );
  }
}
