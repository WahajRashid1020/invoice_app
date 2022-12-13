// ignore_for_file: unnecessary_import, implementation_imports, unused_import, depend_on_referenced_packages, camel_case_types, no_leading_underscores_for_local_identifiers

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/pages/home_page.dart';
import 'package:invoice_app/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:invoice_app/widgets/invoices.dart';

import '../widgets/floatingActionButton.dart';

class transaction extends StatefulWidget {
  const transaction({super.key});

  @override
  State<transaction> createState() => _transactionState();
}

class _transactionState extends State<transaction> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Image(image: AssetImage('assets/images/Figpie.png')),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                      width: _width * 0.952,
                      height: _height,
                      child: const invoices()),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomBar(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: const floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
