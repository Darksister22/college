import 'package:college/API/posts.dart';
import 'package:flutter/material.dart';

class Averages extends StatefulWidget {
  const Averages({super.key, required this.data});
  final dynamic data;
  @override
  State<Averages> createState() => _AveragesState();
}

class _AveragesState extends State<Averages> {
  late String currAvg;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
        title: const Text('عرض معدلات الطالب'),
        content: SizedBox(
          height: 300,
          width: 300,
          child: ListView(
            children: [
              ListTile(
                title: const Text("معدل السنة الاولى"),
                leading: Text(check(widget.data['avg1'].toString())),
              ),
              ListTile(
                title: const Text("معدل السنة الثانية"),
                leading: Text(check(widget.data['avg2'].toString())),
              ),
              ListTile(
                title: const Text("معدل السنة الثالثة"),
                leading: Text(check(widget.data['avg3'].toString())),
              ),
              ListTile(
                title: const Text("معدل السنة الرابعة"),
                leading: Text(check(widget.data['avg4'].toString())),
              ),
              FutureBuilder(
                future:
                    ApiPosts().getCurrentAverage(widget.data['id'].toString()),
                builder: (context, snapshot) {
                  return ListTile(
                    title: const Text("معدل الكورس الحالي"),
                    leading: Text(snapshot.data.toString()),
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('الخروج')),
        ],
      );
    });
  }

  String check(String col) {
    if (col == "null") {
      return "لا يوجد";
    } else {
      return col;
    }
  }
}
