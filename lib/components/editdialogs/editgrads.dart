import 'package:college/API/queries.dart';
import 'package:college/components/formitems.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditGraduate extends StatefulWidget {
  final dynamic data;
  const EditGraduate({super.key, this.data});

  @override
  State<EditGraduate> createState() => _EditGraduateState();
}

class _EditGraduateState extends State<EditGraduate> {
  late TextEditingController nameAr;
  late TextEditingController nameEn;
  late TextEditingController avg1;
  late TextEditingController avg2;
  late TextEditingController avg3;
  late TextEditingController avg4;
  late TextEditingController avgFinal;
  late TextEditingController summerDeg;

  late bool edit;
  late bool logged = false;
  void _loadSharedPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      logged = localStorage.getString("token") == null;
    });
  }

  @override
  void initState() {
    nameAr = TextEditingController(text: widget.data['name_ar']);
    nameEn = TextEditingController(text: widget.data['name_en']);
    avg1 = TextEditingController(text: widget.data['avg1']);
    avg2 = TextEditingController(text: widget.data['avg2']);
    avg3 = TextEditingController(text: widget.data['avg3']);
    avg4 = TextEditingController(text: widget.data['avg4']);
    avgFinal = TextEditingController(text: widget.data['avg_final']);
    summerDeg = TextEditingController(text: widget.data['summer_deg'] ?? "");
    edit = false;
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

    final formkey = GlobalKey<FormState>();
    String? validateInput(String? input) {
      if (input == null || input.isEmpty) {
        return 'الرجاء عدم ترك الحقل فارغاً';
      }
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("عرض و تعديل درجات الطالب"),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(children: [
                    sizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 20.0),
                    input(context, "اسم الطالب",
                        icon: const FaIcon(FontAwesomeIcons.user),
                        enabled: false,
                        controller: nameAr,
                        valiator: validateInput),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "ٍStudent's Name",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: nameEn,
                    ),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "معدل المرحلة الاولى",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: avg1,
                    ),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "معدل المرحلة الثانية",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: avg2,
                    ),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "معدل المرحلة الثالثة",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: avg3,
                    ),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "معدل المرحلة الرابعة",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: avg4,
                    ),
                    sizedBox(height: 20.0),
                    input(
                      context,
                      "المعدل النهائي",
                      icon: const FaIcon(FontAwesomeIcons.calculator),
                      enabled: false,
                      controller: avgFinal,
                    ),
                    sizedBox(height: 20.0),
                  ]),
                ),
              );
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.x)),
            Visibility(
              visible: !logged,
              child: iconLabelButton(() {
                setState(() => edit = !edit);
              }, "تعديل المعلومات", FontAwesomeIcons.userPen),
            ),
            Visibility(
              visible: edit,
              child: iconLabelButton(() async {
                if (formkey.currentState!.validate()) {
                  await ApiPosts().updateGrad(widget.data['id'].toString(),
                      summerDeg.text, showSnackBar);
                }
              }, "حفظ التغييرات", FontAwesomeIcons.floppyDisk),
            )
          ],
        );
      },
    );
  }
}
