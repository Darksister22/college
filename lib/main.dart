// ignore_for_file: unused_import

import 'package:college/screens/home.dart';
import 'package:college/screens/login.dart';
import 'package:college/screens/studentmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'College',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar'), // English
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF335CA8),
              onPrimary: Color(0xFFFFFFFF),
              primaryContainer: Color(0xFFD8E2FF),
              onPrimaryContainer: Color(0xFF001A42),
              secondary: Color(0xFF575E71),
              onSecondary: Color(0xFFFFFFFF),
              secondaryContainer: Color(0xFFDBE2F9),
              onSecondaryContainer: Color(0xFF141B2C),
              tertiary: Color(0xFF715573),
              onTertiary: Color(0xFFFFFFFF),
              tertiaryContainer: Color(0xFFFCD7FB),
              onTertiaryContainer: Color(0xFF2A132D),
              error: Color(0xFFBA1A1A),
              errorContainer: Color(0xFFFFDAD6),
              onError: Color(0xFFFFFFFF),
              onErrorContainer: Color(0xFF410002),
              background: Color(0xFFFEFBFF),
              onBackground: Color(0xFF1B1B1F),
              surface: Color(0xFFFEFBFF),
              onSurface: Color(0xFF1B1B1F),
              surfaceVariant: Color(0xFFE1E2EC),
              onSurfaceVariant: Color(0xFF44474F),
              outline: Color(0xFF75777F),
              onInverseSurface: Color(0xFFF2F0F4),
              inverseSurface: Color(0xFF303034),
              inversePrimary: Color(0xFFAEC6FF),
              shadow: Color(0xFF000000),
              surfaceTint: Color(0xFF335CA8),
              outlineVariant: Color(0xFFC5C6D0),
              scrim: Color(0xFF000000),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )),
            textTheme: GoogleFonts.almaraiTextTheme()),
        home: const StudentMenu());
  }
}
