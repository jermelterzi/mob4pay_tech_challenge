import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontsTextTheme {
  const GoogleFontsTextTheme();

  TextTheme createTextTheme(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    final bodyTextTheme = GoogleFonts.getTextTheme('Inter', baseTextTheme);
    final displayTextTheme = GoogleFonts.getTextTheme('Inter', baseTextTheme);

    return displayTextTheme.copyWith(
      bodyLarge: bodyTextTheme.bodyLarge,
      bodyMedium: bodyTextTheme.bodyMedium,
      bodySmall: bodyTextTheme.bodySmall,
      labelLarge: bodyTextTheme.labelLarge,
      labelMedium: bodyTextTheme.labelMedium,
      labelSmall: bodyTextTheme.labelSmall,
    );
  }
}
