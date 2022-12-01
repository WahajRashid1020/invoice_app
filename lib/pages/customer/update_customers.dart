import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCustomers extends StatefulWidget {
  const UpdateCustomers({Key? key}) : super(key: key);

  @override
  _UpdateCustomersState createState() => _UpdateCustomersState();
}

class _UpdateCustomersState extends State<UpdateCustomers> {
  TextEditingController editName = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  TextEditingController editAddress = TextEditingController();
  TextEditingController editpocName = TextEditingController();
  var name = Get.arguments[0];
  var address = Get.arguments[1];
  var email = Get.arguments[2];
  var pocName = Get.arguments[3];
  var documentId = Get.arguments[4];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    editName.text = name;
    editAddress = address;
    editEmail = email;
    editpocName = pocName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Update Customers")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: TextField(
                controller: editName,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
            ),
            Card(
              child: TextField(
                controller: editEmail,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Card(
              child: TextField(
                controller: editAddress,
                decoration: InputDecoration(
                  labelText: "Address",
                ),
              ),
            ),
            Card(
              child: TextField(
                controller: editpocName,
                decoration: InputDecoration(
                  labelText: "POC Name",
                ),
              ),
            ),
          ],
        ));
  }
}
