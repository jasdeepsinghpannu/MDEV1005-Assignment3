import 'package:flutter/material.dart';
import 'home_page.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'settings_page.dart';
import 'calculator_page.dart';
import 'weather_page.dart';
import 'notes_page.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/contact': (context) => ContactPage(),
        '/settings': (context) => SettingsPage(),
        '/calculator': (context) => CalculatorPage(),
        '/weather': (context) => WeatherPage(),
        '/notes': (context) => NotesPage(),
      },
    );
  }
}