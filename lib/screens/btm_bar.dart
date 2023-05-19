import 'package:e_commerce_app/screens/cart.dart';
import 'package:e_commerce_app/screens/categories.dart';
import 'package:e_commerce_app/screens/home_scren.dart';
import 'package:e_commerce_app/screens/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';





class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}





class _BottomBarScreenState extends State<BottomBarScreen> {

  int _selectedIndex = 0;

  final List _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserScreen()
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      body: _pages[_selectedIndex],

      bottomNavigationBar: Theme(
        data: themeState.getDarkTheme
          ? Theme.of(context).copyWith(canvasColor: Color(0xFFadc3d7)) : Theme.of(context).copyWith(canvasColor: Color(0xFFb8cbd0)),
        child: BottomNavigationBar(
          elevation: 40,
          currentIndex: _selectedIndex,
          unselectedItemColor: themeState.getDarkTheme ? Color(0xFF344d59) : Color(0xFF137c8b),
          selectedItemColor: themeState.getDarkTheme ? Color(0xFF344d59) : Color(0xFF137c8b),
          onTap: _selectedPage,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ? IconlyBold.category : IconlyLight.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
              label: "User",
            ),
          ],
        ),
      ),
    );
  }
}
