import 'package:flutter/material.dart';

class VakinhaUI {
  VakinhaUI._();

  static final ThemeData theme = ThemeData(
    primaryColor: const Color(0xFF007D21),
    primaryColorDark: const Color(0xFF007D21),
    fontFamily: 'MarkPro-Book',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF007D21),
        textStyle: const TextStyle(fontFamily: 'MarkPro-Book'),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[400],
      ),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
}
