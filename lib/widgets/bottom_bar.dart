// ignore_for_file: unused_import, depend_on_referenced_packages, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/pages/add_customer.dart';
import 'package:invoice_app/pages/add_invoice.dart';
import 'package:invoice_app/pages/add_payment.dart';
import 'package:invoice_app/pages/home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:invoice_app/pages/transaction.dart';

class bottomBar extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const bottomBar({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  void onItemTapped(int index) {
    if (index == 0) {
      Get.to(const home());
    } else if (index == 1) {
      Get.to(const transaction());
    } else if (index == 2) {
      Get.to(const addInvoice());
    } else if (index == 3) {
      Get.to(const addCustomer());
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 10,
      ),
      child: Container(
        height: 59,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100),
          ),
          color: Color.fromRGBO(87, 70, 123, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                onItemTapped(value);
              },
              items: [
                const BottomNavigationBarItem(
                    label: (''),
                    icon: ImageIcon(
                      AssetImage('assets/images/User_light.png'),
                      size: 28,
                    )),
                BottomNavigationBarItem(
                  label: (''),
                  icon: Row(
                    children: const [
                      ImageIcon(
                        AssetImage('assets/images/Credit card_light.png'),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                BottomNavigationBarItem(
                  label: (''),
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      ImageIcon(
                        AssetImage('assets/images/Folders_light.png'),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                const BottomNavigationBarItem(
                    label: (''),
                    icon: ImageIcon(
                      AssetImage('assets/images/Group_light.png'),
                      size: 28,
                    )),
              ]),
        ),
      ),
    );
  }
}
