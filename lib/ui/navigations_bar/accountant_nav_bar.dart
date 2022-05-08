import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/ui/company_member/accountant/home.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../company_member/accountant/accountant_completed_orders.dart';
import '../company_member/accountant/accountant_product.dart';
import '../company_member/accountant/catoegoreis_accountant.dart';
import '../company_member/accountant/notifiction.dart';
class NavScreen extends StatefulWidget {
  @override
  State<NavScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<NavScreen> {
  final int _pageCount = 5;
  int _pageIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.home, size: 20),
                Text('Home'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.account_circle, size: 20),
                Text('Hello'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.notifications, size: 20),
                Text('Hello'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, size: 20),
                Text('Hello'),
              ],
            ),Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.favorite, size: 20),
                Text('product'),
              ],
            ),
          ],
          color: Colors.black.withOpacity(0.4),
          buttonBackgroundColor: ColorManager.button,
          backgroundColor: ColorManager.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: _body());
  }

  Widget _body() {
    return Stack(
      children: List<Widget>.generate(_pageCount, (int index) {
        return IgnorePointer(
          ignoring: index != _pageIndex,
          child: Opacity(
            opacity: _pageIndex == index ? 1.0 : 0.0,
            child: Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder: (_) => ppage(index),
                  settings: settings,
                );
              },
            ),
          ),
        );
      }),
    );
  }

  Widget ppage(int index) {
    switch (index) {
      case 0:
        return HomeAccountant();
      case 1:
        return Notifiction();
      case 2:
        return AccountantCategoeies();
      case 3:
        return AccountantCompletedOrders();
      case 4:
        return AccountantProduct();
    }
    throw "Invalid index $index";
  }
}
