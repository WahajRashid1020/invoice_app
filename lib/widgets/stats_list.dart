// ignore_for_file: camel_case_types, unused_import, depend_on_referenced_packages, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/model/floating_bar.dart';
import 'package:invoice_app/pages/home_page.dart';
import 'package:invoice_app/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:invoice_app/widgets/floatingActionButton.dart';

class statsList extends StatefulWidget {
  const statsList({super.key});

  @override
  State<statsList> createState() => _statsListState();
}

class _statsListState extends State<statsList> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
      itemBuilder: (context, index) {
        return Container(
          width: _width * 1,
          height: _height * 0.15,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Color.fromRGBO(240, 240, 240, 1),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, right: 10),
                child: Row(
                  children: [
                    SizedBox(
                        width: _width * 0.86,
                        height: 50,
                        child: Stack(children: <Widget>[
                          Row(
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'Monthly Bills',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                children: const [
                                  Text(
                                    '\$12,022',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ])),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: Row(
                  children: const [
                    ImageIcon(
                      AssetImage('assets/images/Subtract.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
