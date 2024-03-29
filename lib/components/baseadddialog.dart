import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BaseAddDialog extends StatefulWidget {
  final Function func;
  final List<Widget> children;
  final String label;
  final IconData icon;
  final String title;
  final Key formKey;
  const BaseAddDialog(
      {super.key,
      required this.func,
      required this.label,
      required this.icon,
      required this.title,
      required this.formKey,
      required this.children});

  @override
  State<BaseAddDialog> createState() => _BaseAddDialogState();
}

class _BaseAddDialogState extends State<BaseAddDialog> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(20.0),
          title: Text(widget.title),
          content: Builder(
            builder: (context) {
              return SingleChildScrollView(
                child: Form(
                  key: widget.formKey,
                  child: Column(
                    children: widget.children,
                  ),
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
            iconLabelButton(widget.func, widget.label, widget.icon)
          ],
        );
      },
    );
  }
}
