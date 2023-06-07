import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/color_schemes.g.dart';
import 'screens/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((value) => runApp(const CommuteEase()));
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
      home: const LoginPage()
    );
  }
}

