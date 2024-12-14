import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'GunmaHougenKarta2',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainPage(),
    );
  }
}
