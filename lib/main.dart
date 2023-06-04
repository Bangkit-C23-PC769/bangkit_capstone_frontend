import 'package:flutter/material.dart';
import 'utils/color_schemes.g.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const CommuteEase());
}

class CommuteEase extends StatefulWidget {
  const CommuteEase({Key? key}) : super(key: key);

  @override
  State<CommuteEase> createState() => _CommuteEaseState();
}

class _CommuteEaseState extends State<CommuteEase> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
      home: const LoginPage()
    );
  }
}

