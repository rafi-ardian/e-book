import 'package:e_book_app/screens/cart/cart_page.dart';
import 'package:e_book_app/screens/home/home_page.dart';
import 'package:e_book_app/screens/save/save_page.dart';
import 'package:e_book_app/screens/user/user_page.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const nameRoute = '/';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;

  final screens = [HomePage(), SavePage(), CartPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-home.png',
                  width: 20,
                  color: selectedIndex == 0 ? greenColor : greyColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-save-nav.png',
                  width: 14,
                  color: selectedIndex == 1 ? greenColor : greyColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-cart.png',
                  width: 20,
                  color: selectedIndex == 2 ? greenColor : greyColor,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 15),
                child: Image.asset(
                  'assets/icons/icon-user.png',
                  width: 18,
                  color: selectedIndex == 3 ? greenColor : greyColor,
                ),
              ),
              label: ''),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: screens
            .asMap()
            .map((i, screen) => MapEntry(
                i,
                Offstage(
                  offstage: selectedIndex != i,
                  child: screen,
                )))
            .values
            .toList(),
      ),
      bottomNavigationBar: customBottomNav(),
    );
  }
}
