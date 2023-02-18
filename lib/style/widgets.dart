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

Container primaryContainer(context, width, height, child) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          )
        ],
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: child);
}

Text sectionText(context, label) {
  return Text(label,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: Theme.of(context).colorScheme.secondary));
}
