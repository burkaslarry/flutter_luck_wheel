import 'package:flutter/material.dart';
import 'package:flutter_luck_wheel/screens/uploadexcel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lucky Wheel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const UploadExcelScreen(title: 'Merry Christmas'),
    );
  }
}
