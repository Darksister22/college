import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartSemester extends StatefulWidget {
  final dynamic data;
  const StartSemester({super.key, this.data});

  @override
  State<StartSemester> createState() => _StartSemesterState();
}

class _StartSemesterState extends State<StartSemester> {
  late bool logged = false;
  void _loadSharedPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      logged = localStorage.getString("token") == null;
    });
  }

  late TextEditingController year;
  @override
  void initState() {
    year = TextEditingController();
    _loadSharedPreferences();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
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
          title: const Text("بدأ فصل دراسي"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                  child: Form(
                key: formkey,
                child:
                    input(context, "السنة الدراسية الجديدة", valiator: (value) {
                  final yearReg = RegExp(r"\d{4}-\d{4}");
                  if (value == null || value.isEmpty) {
                    return "لا يمكن ترك الحقل فارغاً";
                  }
                  if (!yearReg.hasMatch(value)) {
                    return "صيغة السنة غير صحيحة";
                  }
                  return null;
                }),
              ));
            },
          ),
          actions: [
            iconLabelButton(() {
              Navigator.pop(context);
            }, 'الغاء', FontAwesomeIcons.x),
            iconLabelButton(() async {
              ApiPosts().createSemester(year.text, showSnackBar);
            }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk)
          ],
        );
      },
    );
  }
}
