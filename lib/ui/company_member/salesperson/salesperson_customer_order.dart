import 'package:agc_conpany/ui/company_member/salesperson/salesperson_order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../componant/componant.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/styles_manager.dart';
import '../../../servisers/firebase_provider.dart';

class SalespersonCustomerOrder extends StatelessWidget {
  const SalespersonCustomerOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Consumer<FireBaseProvider>(builder: (index, provider, x) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'طلبات الزبائن',
                style: getBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s22),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.orderSalesPerson.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          provider.getProductFromOrder(provider.orderSalesPerson[index].lineItems!);
                          Get.to(SalespersonOrderDetails());
                        } ,
                        child: CustomerOrder(provider.orderSalesPerson[index])
                    );},

                ),
              ),
            ],
          ),
        );
      }),
    ));
  }
}
