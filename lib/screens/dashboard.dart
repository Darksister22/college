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
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
            sizedBox(height: 40.0),
            sectionText(context, "ملخص النظام"),
            sizedBox(height: 10.0),
            primaryContainer(
                context,
                width,
                height / 5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "العام الدراسي",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        Text("2022-2023",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "الفصل الدراسي",
                          style: TextStyle(
                              fontSize: 30,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        Text("الأول",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer))
                      ],
                    )
                  ],
                )),
            sizedBox(height: 30.0),
            sectionText(context, "احصائيات سريعة"),
            sizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 4.5,
                  height: height / 6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("230",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          Text(
                            'عدد الطلبة الحاليين',
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: width / 4.5,
                  height: height / 6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("28",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          Text(
                            'عدد الكورسات لهذا الفصل',
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                  ),
                ),
                Container(
                  width: width / 4.5,
                  height: height / 6,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("15",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          Text(
                            'عدد التدريسيين الحالي',
                            style: TextStyle(fontSize: 20),
                          ),
                        ]),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
