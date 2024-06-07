import 'package:contactlistapp/screens/contactscreen.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _customThemeData(),
      debugShowCheckedModeBanner: false,
      home: const ContactScreen(),
    );
  }

  ThemeData _customThemeData() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleSpacing: 10,
        centerTitle: true,
        elevation: 1,
        backgroundColor: Color.fromRGBO(102, 124, 137, 1),
        foregroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      listTileTheme: const ListTileThemeData(
          tileColor: Color.fromRGBO(238, 238, 238, 1)
      ),
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(8)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(8)
          )
      ),
    );
  }
}
