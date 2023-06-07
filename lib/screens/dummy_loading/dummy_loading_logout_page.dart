import 'package:flutter/material.dart';
import '../login_page.dart';

class DummyLoadingLogoutPage extends StatefulWidget {
  const DummyLoadingLogoutPage({Key? key}) : super(key: key);

  @override
  State<DummyLoadingLogoutPage> createState() => _DummyLoadingLogoutPageState();
}

class _DummyLoadingLogoutPageState extends State<DummyLoadingLogoutPage> {

  @override
  void initState() {
    super.initState();
    // here is the logic
    Future.delayed(const Duration(seconds: 1)).then((__) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return const LoginPage();
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
