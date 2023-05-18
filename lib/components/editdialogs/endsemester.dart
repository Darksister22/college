import 'package:college/API/queries.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EndSemester extends StatefulWidget {
  final dynamic data;
  const EndSemester({super.key, this.data});

  @override
  State<EndSemester> createState() => _EndSemesterState();
}

class _EndSemesterState extends State<EndSemester> {
  late bool logged = false;
  void _loadSharedPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      logged = localStorage.getString("token") == null;
    });
  }

  @override
  void initState() {
    _loadSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void showSnackBar(String message, {bool isError = false}) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isError ? Colors.red : Colors.green,
        ),
      );
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("انهاء الفصل الدراسي"),
          content: Builder(
            builder: (context) {
              return const SingleChildScrollView(
                child:
                    Text('هل انت متأكد؟ لن تستطيع عكس العملية في حال المتابعة'),
              );
            },
          ),
          actions: [
            iconLabelButton(() {
              Navigator.pop(context);
            }, 'الغاء', FontAwesomeIcons.x),
            iconLabelButton(() async {
              ApiPosts().endSemester(showSnackBar);
            }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
