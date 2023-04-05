import 'package:college/components/selectlists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectYear extends StatelessWidget {
  const SelectYear({super.key});

  @override
  Widget build(BuildContext context) {
    String selYear = '2023-2022';
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: const Text("اختيار السنة الدراسية"),
          content: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                SelectYears(selYear: selYear),
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
                  Navigator.pushNamed(context, '/yearmenu');
                },
                icon: const FaIcon(FontAwesomeIcons.arrowLeft, size: 10),
                label: const Text('الذهاب'))
          ],
        );
      },
    );
  }
}
