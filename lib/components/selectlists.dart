import 'package:flutter/material.dart';

final List<String> _year = [
  'السنة الاولى',
  'السنة الثانية',
  'السنة الثالثة',
  'السنة الرابعة',
  'الماجستير',
  'الدكتوراة'
];

class SelectLevels extends StatefulWidget {
  final String selYear;
  const SelectLevels({Key? key, required this.selYear}) : super(key: key);

  @override
  State<SelectLevels> createState() => _SelectLevelsState();
}

class _SelectLevelsState extends State<SelectLevels> {
  late String selYear;
  @override
  void initState() {
    super.initState();
    selYear = widget.selYear;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: const Text('السنة الدراسية'),
      value: selYear,
      onChanged: (newValue) {
        setState(() {
          selYear = newValue.toString();
        });
      },
      items: _year.map((year) {
        return DropdownMenuItem(
          value: year,
          child: Text(year),
        );
      }).toList(),
    );
  }
}
