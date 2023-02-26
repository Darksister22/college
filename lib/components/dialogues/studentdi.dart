import 'package:college/components/selectlists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    String selYear = 'السنة الاولى';
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: Text("اضافة طالب جديد"),
          content: SingleChildScrollView(
            child: Column(children: [SelectLevels(selYear: selYear)]),
          ),
        );
      },
    );
  }
}
