// ignore_for_file: unused_import, depend_on_referenced_packages, camel_case_types, sort_child_properties_last, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/pages/add_customer.dart';
import 'package:invoice_app/pages/add_invoice.dart';
import 'package:invoice_app/pages/add_payment.dart';
import 'package:invoice_app/pages/add_project.dart';
import 'package:invoice_app/pages/home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:invoice_app/pages/transaction.dart';
import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class floatingActionButton extends StatefulWidget {
  const floatingActionButton({super.key});

  @override
  State<floatingActionButton> createState() => _floatingActionButtonState();
}

class _floatingActionButtonState extends State<floatingActionButton> {
  Widget _offsetPopup() => PopupMenuButton<int>(
      offset: Offset(
        40,
        -210,
      ),
      elevation: 10,
      itemBuilder: (context) => [
            PopupMenuItem(
                value: 1,
                child: InkWell(
                  onTap: () {
                    Get.to(addInvoice());
                  },
                  child: Text(
                    'Create New Invoice',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(87, 70, 123, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            PopupMenuItem(
                value: 2,
                child: InkWell(
                  onTap: () {
                    Get.to(addPayment());
                  },
                  child: Text(
                    'Add New Payment',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(87, 70, 123, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            PopupMenuItem(
                value: 3,
                child: InkWell(
                  onTap: () {
                    Get.to(addCustomer());
                  },
                  child: Text(
                    'Add new Customer',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(87, 70, 123, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
            PopupMenuItem(
                value: 4,
                child: InkWell(
                  onTap: () {
                    Get.to(addProject());
                  },
                  child: Text(
                    'Add New Project',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(87, 70, 123, 1),
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )),
          ],
      icon: Container(
        child: Icon(
          Icons.add_rounded,
          size: 58,
          color: Colors.white,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: ShapeDecoration(
            color: Color.fromRGBO(113, 126, 231, 1),
            shape: StadiumBorder(
              side: BorderSide(color: Colors.transparent, width: 0),
            )),
      ));
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 80.0, width: 80.0, child: _offsetPopup());
  }
}
