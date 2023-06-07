import 'package:flutter/material.dart';
import '../navigation_page.dart';

class DummyLoadingLoginPage extends StatefulWidget {
  const DummyLoadingLoginPage({Key? key}) : super(key: key);

  @override
  State<DummyLoadingLoginPage> createState() => _DummyLoadingLoginPageState();
}

class _DummyLoadingLoginPageState extends State<DummyLoadingLoginPage> {

  @override
  void initState() {
    super.initState();
    // here is the logic
    Future.delayed(const Duration(seconds: 1)).then((__) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return const NavigationPage();
          })
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
