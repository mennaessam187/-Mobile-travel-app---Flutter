import 'package:flutter/material.dart';
import 'package:mobile_travel/screans/categories_screan.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_travel/screans/category_trips.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // location of the whriting
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // English
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: 'NotoNaskhArabic',
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontFamily: 'NotoNaskhArabic',
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontFamily: 'NotoNaskhArabic',
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontFamily: 'NotoNaskhArabic',
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(fontFamily: "NotoNaskhArabic"),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: categoryScreen(),
      routes: {
        "second": (context) => trippage(),
      },
    );
  }
}
