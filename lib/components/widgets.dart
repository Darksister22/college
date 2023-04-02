import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

ElevatedButton iconLabelButton(onPressed, label, icon) {
  return ElevatedButton.icon(
    onPressed: onPressed,
    label: Text(label),
    icon: FaIcon(icon),
  );
}

Container primaryContainer(context, width, height, child) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
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

Container statContainer(context, width, height, stat, title, icon) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      color: Theme.of(context).colorScheme.tertiaryContainer,
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          icon,
          sizedBox(width: 30.0),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(stat,
                    style: const TextStyle(
                        fontSize: 50, fontWeight: FontWeight.bold)),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
              ]),
        ],
      ),
    ),
  );
}

Widget buttonCard(context, width, height, icon, label, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            icon,
            sizedBox(width: 30.0),
            Text(label,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}

Widget progressIndicator(context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 1.3,
    child: Center(
      child: Column(
        children: [
          SpinKitPouringHourGlass(
            color: Theme.of(context).primaryColor,
          ),
          const Text("يتم التحميل...")
        ],
      ),
    ),
  );
}

Widget errorIndicator(context, label) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 1.3,
    child: Center(
      child: Column(
        children: [
          FaIcon(
            FontAwesomeIcons.triangleExclamation,
            color: Theme.of(context).colorScheme.error,
          ),
          Text(
            label,
            style:
                TextStyle(color: Theme.of(context).colorScheme.errorContainer),
          )
        ],
      ),
    ),
  );
}

DataCell dataCell(text, {direction, color}) {
  return DataCell(rowText(text, direction: direction, color: color));
}

DataColumn dataColumn(text, context, {numeric = false}) {
  return DataColumn(label: colText(text, context), numeric: numeric);
}

Text rowText(text, {direction, color}) {
  return Text(
    text,
    textDirection: direction,
    style: TextStyle(fontSize: 20, color: color),
  );
}

Text colText(text, context) {
  return Text(
    text,
    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
  );
}

Future<bool> checkGuest() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  return localStorage.getString('token') == null;
}
