import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'fifteen'),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
