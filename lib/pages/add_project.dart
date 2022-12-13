// ignore_for_file: camel_case_types, unused_import, implementation_imports, unnecessary_import, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/pages/home_page.dart';
import 'package:invoice_app/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../widgets/floatingActionButton.dart';

class addProject extends StatefulWidget {
  const addProject({super.key});

  @override
  State<addProject> createState() => _addProjectState();
}

class _addProjectState extends State<addProject> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Row(
              children: [
                Column(
                  children: const [
                    Text(
                      'Add Project',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 13.0),
                      child: Text(
                        '28/11/2022',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Column(
                children: const [],
              ),
              Column(
                children: [
                  SizedBox(
                      width: _width * 0.88,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w200),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      )),
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: _width * 1,
            child: DataTable(
                headingRowColor: MaterialStateColor.resolveWith(
                  (states) => Color.fromRGBO(240, 240, 240, 1),
                ),
                columnSpacing: 50,
                columns: [
                  const DataColumn(
                    label: Text('Title'),
                  ),
                  const DataColumn(
                    label: Text('Action '),
                  ),
                ],
                dataRowHeight: 80,
                rows: [
                  DataRow(cells: [
                    DataCell(Text('First Project')),

                    DataCell(
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.edit,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: _width * 0.04,
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () => {},
                                child: Icon(
                                  Icons.delete,
                                  size: 20,
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    // DataCell(Icon(Icons.delete)),
                  ])
                ]),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                color: Color.fromRGBO(87, 70, 123, 1),
              ),
              height: 50,
              width: _width * 0.82,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(87, 70, 123, 1),
                  ),
                  onPressed: () {
                    Get.to(HomePage());
                  },
                  child: Text(
                    'SUBMIT',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
          )
        ],
      ),
      bottomNavigationBar: bottomBar(
        scaffoldKey: scaffoldKey,
      ),
      floatingActionButton: const floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
