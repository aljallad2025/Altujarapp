import 'package:flutter/material.dart';

class AppColors {
  static const Color card = Color(0xFF1C6A93);
  static const Color cardLight = Color(0xFF1F7AA3);
  static const Color cardDark = Color(0xFF155578);
  static const Color gold = Color(0xFFB08D4E);
  static const Color bg = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFE7ECF1);
  static const Color text = Color(0xFF16212B);
  static const Color navGray = Color(0xFF93A0AC);
  static const Color subLight = Color(0xFFBFD6E4);
  static const Color navBg1 = Color(0xFFEAF2F8);
  static const Color navBg2 = Color(0xFFDCEAF3);

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [cardLight, cardDark],
  );
}
