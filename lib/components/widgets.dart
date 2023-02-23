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

Widget buttonCard(context, width, height, icon, label) {
  return GestureDetector(
    onTap: () {},
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
