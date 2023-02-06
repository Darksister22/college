import 'package:flutter/material.dart';

SizedBox sizedBox({width = 0.0, height = 0.0}) {
  return SizedBox(
    width: width,
    height: height,
  );
}

ElevatedButton hotElevatedButton(onPressed, label) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: const Size(350, 40)),
      child: Text(label));
}
