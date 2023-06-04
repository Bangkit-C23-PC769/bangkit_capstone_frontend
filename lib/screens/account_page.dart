import 'package:flutter/material.dart';
import '../utils/color_schemes.g.dart';
import 'dummy_loading/dummy_loading_logout_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightColorScheme.primaryContainer,
        body: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30, left: 25, right: 25),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile_photo.jpg'),
                      radius: 64,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 25, left: 25, right: 25),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Full Name',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              'John Doe',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Email',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              'johndoe@gmail.com',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Username',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const Text(
                              'johndoe',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(
                          height: 50,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        FilledButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                    return const DummyLoadingLogoutPage();
                                  })
                              );
                            },
                            child: const Text(
                              'Logout',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)
                              ,
                            )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
