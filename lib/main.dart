import 'package:flutter/material.dart';
import 'widget_tree.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            backgroundColor: kPurpleDark,
          ),
          primaryColor: kPurpleDark,
          scaffoldBackgroundColor: kPurpleDark,
          canvasColor: kPurpleDark,
        ),
        home: WidgetTree());
  }
}
