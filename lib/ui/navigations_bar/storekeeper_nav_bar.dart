
import 'package:agc_conpany/resources/color_manager.dart';
import 'package:agc_conpany/resources/font_manager.dart';
import 'package:agc_conpany/resources/styles_manager.dart';
import 'package:agc_conpany/ui/admin/admin_home.dart';
import 'package:agc_conpany/ui/admin/admin_member_join_req.dart';
import 'package:agc_conpany/ui/company_member/accountant/home.dart';
import 'package:agc_conpany/ui/company_member/secretary/secertary_home.dart';
import 'package:agc_conpany/ui/company_member/secretary/secretary_complete_order.dart';
import 'package:agc_conpany/ui/company_member/secretary/secretary_customer_join.dart';
import 'package:agc_conpany/ui/company_member/secretary/secretary_customer_list.dart';
import 'package:agc_conpany/ui/company_member/storekeeper/storekeeper_home.dart';
import 'package:agc_conpany/ui/registration/login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../company_member/storekeeper/storeKeeper_add_to_stake.dart';
import '../company_member/storekeeper/storekeeper_order.dart';
import '../company_member/storekeeper/storekeeper_to_driver.dart';



class StoreKeeperNavBar extends StatefulWidget {
  @override
  State<StoreKeeperNavBar> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StoreKeeperNavBar> {
  final int _pageCount = 4;
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
                  IconAssets.add_to_stake,width: 20.w,height: 20.h,
                ),
                const Text('إضافة كميات'),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SvgPicture.asset(
                  IconAssets.orders,width: 20.w,height: 20.h,
                ),
                const Text('الطلبات '),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                SvgPicture.asset(
                  IconAssets.transfer_order,width: 20.w,height: 20.h,
                ),
                 Text('تحويل الطلبات',style: getRegularStyle(color: ColorManager.black,fontSize: FontSize.s11),),
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
        return StoreKeeperHome();
      case 1:
        return StoreKeeperAddToStake();
      case 2:
        return StoreKeeperCustomerOrder();
      case 3:
        return StoreKeeperTransferOrderToDriver();
    }
    throw "Invalid index $index";
  }
}
