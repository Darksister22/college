import 'package:college/screens/dashboard.dart';
import 'package:college/style/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Dashboard(
      title: "نظام اللجنة الامتحانية",
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            sizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  "مرحباً بك في نظام اللجنة الامتحانية لقسم هندسة الحاسوب - جامعة النهرين",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
                const Spacer(),
                Column(
                  children: [
                    const FaIcon(FontAwesomeIcons.userTie),
                    sizedBox(height: 5.0),
                    const Text("User")
                  ],
                ),
                sizedBox(width: 20.0)
              ],
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
                statContainer(
                    context,
                    width / 4.5,
                    height / 6,
                    "230",
                    'عدد الطلبة الحاليين',
                    const FaIcon(
                      FontAwesomeIcons.userGraduate,
                      size: 50,
                    )),
                statContainer(
                    context,
                    width / 4.5,
                    height / 6,
                    "28",
                    "عدد الكورسات لهذا الفصل",
                    const FaIcon(
                      FontAwesomeIcons.bookAtlas,
                      size: 50,
                    )),
                statContainer(
                    context,
                    width / 4.5,
                    height / 6,
                    "13",
                    'عدد التدريسيين الحالي',
                    const FaIcon(
                      FontAwesomeIcons.users,
                      size: 50,
                    )),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
