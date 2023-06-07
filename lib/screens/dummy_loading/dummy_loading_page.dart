import 'package:flutter/material.dart';
import '../status_page.dart';

class DummyLoadingPage extends StatefulWidget {
  const DummyLoadingPage({Key? key}) : super(key: key);

  @override
  State<DummyLoadingPage> createState() => _DummyLoadingPageState();
}

class _DummyLoadingPageState extends State<DummyLoadingPage> {

  @override
  void initState() {
    super.initState();
    // here is the logic
    Future.delayed(const Duration(seconds: 2)).then((__) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
            return const StatusPage();
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
