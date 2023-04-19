import 'package:flutter/material.dart';

class SelectList extends StatefulWidget {
  const SelectList(
      {super.key,
      required this.type,
      required this.selection,
      required this.onSelectionChanged,
      this.edit,
      required this.label});
  final int type;
  final String selection;
  final bool? edit;
  final String label;
  final ValueChanged<String> onSelectionChanged;

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  late String selection;
  late int type;
  late List<String> map;
  @override
  void initState() {
    selection = widget.selection;
    type = widget.type;
    switch (type) {
      case 1:
        {
          map = [
            'السنة الاولى',
            'السنة الثانية',
            'السنة الثالثة',
            'السنة الرابعة',
            'الماجستير',
            'الدكتوراة'
          ];
          break;
        }
      case 2:
        {
          map = [
            'عضو - قراءة و تعديل',
            'رئيس - جميع الصلاحيات',
          ];
          break;
        }
      case 3:
        {
          ['2023-2022', '2022-2021', '2021-2020'];
          break;
        }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.edit ?? true,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.surface,
          filled: true,
          labelStyle: const TextStyle(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.outline, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error, width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error, width: 1.0)),
        ),
        isExpanded: true,
        hint: Text(widget.label),
        value: selection,
        onChanged: (newValue) {
          setState(() {
            debugPrint(newValue);
            selection = newValue.toString();
            widget.onSelectionChanged(selection);
          });
        },
        items: map.map((val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
      ),
    );
  }
}
