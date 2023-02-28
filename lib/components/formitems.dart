import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';

TextFormField input(context, label,
    {controller, valiator, password = false, icon}) {
  return TextFormField(
    controller: controller,
    validator: valiator,
    obscureText: password,
    decoration: inputDecor(context, label, icon: icon),
  );
}

inputDecor(context, label, {icon}) {
  return InputDecoration(
    fillColor: Theme.of(context).colorScheme.surface,
    filled: true,
    suffixIcon: Column(
      mainAxisSize: MainAxisSize.min,
      children: [sizedBox(height: 7.0), icon],
    ),
    label: Text(label),
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
        borderSide:
            BorderSide(color: Theme.of(context).colorScheme.error, width: 1.0)),
  );
}
