import 'package:flutter/material.dart';

Text onSecondaryContainer(context, label, size) {
  return Text(
    label,
    style: TextStyle(
        color: Theme.of(context).colorScheme.onSecondaryContainer,
        fontSize: size,
        fontWeight: FontWeight.w800),
  );
}

Text mainSurface(context, label) {
  return Text(
    label,
    style: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w900,
        fontSize: 25),
  );
}
