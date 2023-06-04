import 'package:flutter/material.dart';
import 'dummy_loading/dummy_loading_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formState = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formState,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 128,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'CommuteEase',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold)
                      ,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your username',
                  ),
                  controller: _usernameController,
                  validator: (value) {
                    return (value == '') ? 'Required' : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    return (value == '') ? 'Required' : null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                              return const DummyLoadingLoginPage();
                            })
                          );
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold)
                        ,
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

