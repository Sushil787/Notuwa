import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kuraa/core/theme/app_colors.dart';

/// Class defining theme of the application
class AppTheme {
  /// Returns the theme of the app
  // static ThemeData getTheme(ThemeState state) {
  //   return state == ThemeState.light ? lightThemeData : darkThemeData;
  // }

  /// Light Theme
  static final ThemeData lightThemeData = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: LightColor.primaryColor,
    iconTheme: const IconThemeData(color: LightColor.secondaryColor),
    useMaterial3: true,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: LightColor.primaryColor,
      selectedItemColor: LightColor.primaryColor,
      unselectedItemColor: LightColor.secondaryColor,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: LightColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: LightColor.grey,
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    // fontFamily: AssetConstants.robotoRegular,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        color: LightColor.secondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        color: LightColor.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: LightColor.primaryColor,
      brightness: Brightness.light,
      onSecondary: LightColor.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: LightColor.grey,
        backgroundColor: LightColor.eclipse,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightColor.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: LightColor.lightGrey,
            width: 2,
          ),
        ),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: LightColor.grey,
      thickness: 1,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: LightColor.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: LightColor.lightGrey,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: LightColor.lightGrey,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: LightColor.lightGrey,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      suffixIconColor: LightColor.secondaryColor,
      prefixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return Colors.black;
        }

        return LightColor.secondaryColor;
      }),
      labelStyle: const TextStyle(
        color: LightColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: LightColor.grey,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );

  /// Dark theme
  static final ThemeData darkThemeData = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: DarkColor.primaryColor,
    iconTheme: const IconThemeData(color: DarkColor.secondaryColor),
    useMaterial3: true,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DarkColor.primaryColor,
      selectedItemColor: DarkColor.primaryColor,
      unselectedItemColor: DarkColor.secondaryColor,
      elevation: 0,
      selectedLabelStyle: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: DarkColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: DarkColor.secondaryColor,
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkColor.primaryColor,
    cardColor: DarkColor.secondaryColor,
    unselectedWidgetColor: DarkColor.secondaryColor,
    // fontFamily: AssetConstants.robotoRegular,
    splashColor: DarkColor.secondaryColor,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        color: DarkColor.secondaryColor,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        color: DarkColor.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: DarkColor.secondaryColor,
      brightness: Brightness.dark,
      onSecondary: LightColor.secondaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: DarkColor.secondaryColor,
        backgroundColor: DarkColor.secondaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DarkColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(
            color: DarkColor.grey,
          ),
        ),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: DarkColor.secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColor.grey,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColor.grey,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkColor.grey,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red.withOpacity(
            0.1,
          ),
        ),
      ),
      suffixIconColor: LightColor.secondaryColor,
      prefixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.focused)) {
          return DarkColor.lightGrey;
        }

        return DarkColor.secondaryColor;
      }),
      labelStyle: const TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      hintStyle: const TextStyle(
        color: DarkColor.secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: TextStyle(
        color: Colors.red.withOpacity(0.1),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
  );
}
