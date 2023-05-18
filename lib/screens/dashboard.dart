// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:college/components/sidebar.dart';
import 'package:college/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  final String title;
  final Widget child;
  final selectedRoute;
  const Dashboard(
      {Key? key,
      required this.title,
      required this.child,
      required this.selectedRoute})
      : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String title;
  late Widget child;
  late var selectedRoute;
  late bool logged = false;
  void _loadSharedPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      logged = localStorage.getString("token") == null &&
          localStorage.getString("role") != "superadmin";
    });
  }

  @override
  void initState() {
    super.initState();
    title = widget.title;
    child = widget.child;
    selectedRoute = widget.selectedRoute;
    _loadSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(title),
          actions: [
            Visibility(
              visible: !logged,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/settingsmenu");
                  },
                  icon: const FaIcon(FontAwesomeIcons.gear)),
            ),
            sizedBox(width: 5.0),
            IconButton(
                onPressed: () async {
                  try {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    await preferences.clear();
                    Navigator.pushReplacementNamed(context, '/');
                  } catch (e) {
                    rethrow;
                  }
                },
                icon: const FaIcon(FontAwesomeIcons.doorOpen)),
          ],
        ),
        sideBar: sideBar(context, selectedRoute),
        body: child);
  }
}
