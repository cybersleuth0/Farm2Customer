import 'package:farm2customer/ui_pages/BottomNavigation/Explore.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/HomePage.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/cart_screen.dart';
import 'package:flutter/material.dart';

class Basehomepage extends StatefulWidget {
  const Basehomepage({super.key});

  @override
  State<Basehomepage> createState() => _BasehomepageState();
}

class _BasehomepageState extends State<Basehomepage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomePageNavigation(),
    ExplorePageNavigation(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _pages[_selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              destinations: [
                NavigationDestination(
                    label: "Shop", icon: Icon(Icons.home_outlined)),
                NavigationDestination(
                    label: "Explore", icon: Icon(Icons.manage_search)),
                NavigationDestination(
                  label: "Cart",
                  icon: Icon(Icons.shopping_cart_outlined),
                ),
              ])),
    );
  }
}
