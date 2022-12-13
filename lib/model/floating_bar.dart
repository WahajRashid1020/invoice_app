// ignore_for_file: unused_import, depend_on_referenced_packages, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/pages/add_invoice.dart';
import 'package:invoice_app/pages/add_payment.dart';
import 'package:invoice_app/pages/home.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:invoice_app/pages/transaction.dart';
import 'dart:developer';

import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class floatingBar extends StatefulWidget {
  const floatingBar({super.key});

  @override
  State<floatingBar> createState() => _floatingBarState();
}

class _floatingBarState extends State<floatingBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
