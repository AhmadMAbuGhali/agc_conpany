import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/ui/admin/admin_home.dart';
import 'package:agc_conpany/ui/admin/admin_member_join_req.dart';
import 'package:agc_conpany/ui/company_member/accountant/home.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../../resources/assets_manager.dart';
import 'admin_company_member.dart';

class AdminNavBar extends StatefulWidget {
  @override
  State<AdminNavBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<AdminNavBar> {
  final int _pageCount = 3;
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
              children:  [
                SvgPicture.asset(
                  IconAssets.admin_home,width: 20.w,height: 20.h,
                ),
                const Text('الرئيسة'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SvgPicture.asset(
                  IconAssets.admin_company_member,width: 20.w,height: 20.h,
                ),
                const Text('الأعضاء'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SvgPicture.asset(
                  IconAssets.admin_join,width: 20.w,height: 20.h,
                ),
                const Text('طلبات  الانضمام'),
              ],
            ),

          ],
          color: Colors.white.withOpacity(0.11),
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
        return AdminHome();
      case 1:
        return AdminCompanyMember();
      case 2:
        return AdminMemberJoin();

    }
    throw "Invalid index $index";
  }
}
