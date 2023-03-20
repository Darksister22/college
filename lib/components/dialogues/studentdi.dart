import 'package:college/components/formitems.dart';
import 'package:college/components/selectlists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    String selYear = 'السنة الاولى';
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("اضافة طالب جديد"),
          content: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                SelectLevels(selYear: selYear),
                TextFormField(
                  decoration: const InputDecoration(label: Text("اسم الطالب")),
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(label: Text("Student's Name")),
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
            Spacer(),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.plus, size: 10),
                label: Text('اضافة'))
          ],
        );
      },
    );
  }
}
