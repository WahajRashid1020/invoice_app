import 'package:flutter/material.dart';
import 'package:invoice_app/auth.dart';
import 'package:invoice_app/pages/customer/customer_page.dart';
import 'package:invoice_app/pages/login_register_page.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const CustomerPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
