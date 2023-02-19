import 'package:college/style/sidebar.dart';
import 'package:college/style/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  final String title;
  final Widget child;
  const Dashboard({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String title;
  late Widget child;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    child = widget.child;
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
                onPressed: () {}, icon: const FaIcon(FontAwesomeIcons.gear)),
            sizedBox(width: 5.0),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(FontAwesomeIcons.doorOpen)),
          ],
        ),
        sideBar: sideBar,
        body: child);
  }
}
