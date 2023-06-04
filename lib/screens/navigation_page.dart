import 'package:flutter/material.dart';
import 'home_page.dart';
import 'account_page.dart';
import 'route_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int currentPageIndex = 0;

  final screens = [
    const HomePage(),
    const RoutePage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_sharp),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_transit_filled_outlined),
            selectedIcon: Icon(Icons.directions_transit_filled),
            label: 'Route',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: screens[currentPageIndex],
    );
  }
}
