import 'package:college/API/queries.dart';
import 'package:college/components/widgets.dart';
import 'package:college/screens/menus/yearmenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectYear extends StatefulWidget {
  final String level;
  const SelectYear({super.key, required this.level});

  @override
  State<SelectYear> createState() => _SelectYearState();
}

class _SelectYearState extends State<SelectYear> {
  @override
  Widget build(BuildContext context) {
    String? selYear;
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("اختيار السنة الدراسية"),
          content: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                FutureBuilder(
                  future: ApiPosts().getYears(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<String> dataList = snapshot.data
                          .map((item) => item['year'].toString())
                          .toList()
                          .cast<String>(); // Cast the list to List<String>
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                          return DropdownButtonFormField<String>(
                            isExpanded: true,
                            validator: (value) {
                              if (value == null) {
                                return " الرجاء  اختيار السنة الدراسية ";
                              }
                              return null;
                            },
                            hint: const Text('اختيار السنة الدراسية'),
                            value: selYear,
                            onChanged: (newValue) {
                              setState(() {
                                selYear = newValue.toString();
                              });
                            },
                            items: dataList.map((ins) {
                              return DropdownMenuItem(
                                value: ins,
                                child: Text(ins),
                              );
                            }).toList(),
                          );
                        },
                      );
                    }
                    return progressIndicator(context);
                  },
                ),
              ]),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const FaIcon(FontAwesomeIcons.x, size: 10)),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          YearMenu(level: widget.level, year: selYear),
                    ),
                  );
                },
                icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 10),
                label: const Text('الذهاب'))
          ],
        );
      },
    );
  }
}
