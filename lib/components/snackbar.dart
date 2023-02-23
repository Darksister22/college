import 'package:flutter/material.dart';

extension BuildContextExtentions on BuildContext {
  ScaffoldFeatureController showSnackBar(
    String message, {
    bool isError = false,
    Color? color,
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 2),
  }) =>
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.fixed,
          backgroundColor:
              color ?? (isError ? const Color(0xFFBA1A1A) : Colors.green),
          action: action,
          duration: duration,
        ),
      );
}
