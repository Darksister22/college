import 'package:flutter/material.dart';

class SelectList extends StatefulWidget {
  const SelectList(
      {super.key,
      required this.map,
      required this.onSelectionChanged,
      this.edit,
      required this.label});
  final List<String> map;
  final bool? edit;
  final String label;
  final ValueChanged<String> onSelectionChanged;

  @override
  State<SelectList> createState() => _SelectListState();
}

class _SelectListState extends State<SelectList> {
  late String? selection;
  late int type;
  @override
  void initState() {
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
        value: selection ?? "",
        hint: Text(widget.label),
        onChanged: (newValue) {
          setState(() {
            selection = newValue.toString();
            widget.onSelectionChanged(selection!);
          });
        },
        items: widget.map.map((val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
      ),
    );
  }
}
