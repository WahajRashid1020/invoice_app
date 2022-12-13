// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, implementation_imports, unnecessary_import, unused_import, depend_on_referenced_packages, camel_case_types, prefer_const_constructors, sized_box_for_whitespace, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:invoice_app/pages/home_page.dart';
import 'package:invoice_app/widgets/bottom_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../widgets/floatingActionButton.dart';

class addInvoice extends StatefulWidget {
  const addInvoice({super.key});

  @override
  State<addInvoice> createState() => _addInvoiceState();
}

class _addInvoiceState extends State<addInvoice> {
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
                      'New Invoice',
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
            child: Row(
              children: [
                Column(
                  children: const [
                    Text(
                      'Invoice # SI-SF-281122-004 ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(94, 63, 190, 1),
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
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
            child: Row(
              children: [
                Column(
                  children: const [
                    Text(
                      'Bill to : ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: _width * 0.4,
                ),
                Column(
                  children: const [
                    Text(
                      'Payable to : ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Column(
                children: [
                  SizedBox(
                      width: _width * 0.3,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Choose Customer',
                          hintStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w200),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: _width * 0.25,
              ),
              Column(
                children: [
                  SizedBox(
                      width: _width * 0.3,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Payment Method',
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Column(
                  children: const [
                    Text(
                      'Payment Method',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Column(
                children: [
                  SizedBox(
                      width: _width * 0.3,
                      child: TextField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Choose Customer',
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
                columnSpacing: 20,
                columns: [
                  const DataColumn(
                    label: Text('Name'),
                  ),
                  const DataColumn(
                    label: Text('Email'),
                  ),
                  const DataColumn(
                    label: Text('Address'),
                  ),
                  const DataColumn(
                    label: Text('POC'),
                  ),
                  const DataColumn(
                    label: Text('Action'),
                  ),
                ],
                dataRowHeight: 80,
                rows: [
                  DataRow(cells: [
                    DataCell(
                      Text(
                        'Akram Khan	',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    DataCell(Text(
                      'akramkhan\n@gmail.com',
                      style: TextStyle(fontSize: 13),
                    )),
                    DataCell(Text(
                      'Block 5 \nClifton 100 Karachi',
                      style: TextStyle(fontSize: 13),
                    )),
                    DataCell(Text(
                      'Check',
                      style: TextStyle(fontSize: 13),
                    )),
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
                  ]),
                  DataRow(cells: [
                    DataCell(
                      Text(
                        'Akram Khan	',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                    DataCell(Text(
                      'akramkhan\n@gmail.com',
                      style: TextStyle(fontSize: 13),
                    )),
                    DataCell(Text(
                      'Block 5 \nClifton 100 Karachi',
                      style: TextStyle(fontSize: 13),
                    )),
                    DataCell(Text(
                      'Check',
                      style: TextStyle(fontSize: 13),
                    )),
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
