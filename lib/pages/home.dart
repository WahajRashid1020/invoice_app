// ignore_for_file: camel_case_types, unused_import, depend_on_referenced_packages, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/model/floating_bar.dart';
import 'package:invoice_app/pages/home_page.dart';
import 'package:invoice_app/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:invoice_app/widgets/floatingActionButton.dart';
import 'package:invoice_app/widgets/stats_list.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
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
                  Container(
                      width: _width * 0.951,
                      height: _height,
                      child: const statsList()),
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
