import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invoice_app/utils/backend.dart';

class AddCustomers extends StatefulWidget {
  const AddCustomers({Key? key}) : super(key: key);

  @override
  _AddCustomersState createState() => _AddCustomersState();
}

class _AddCustomersState extends State<AddCustomers> {
  String value = "";
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _address = TextEditingController();
  final _pocName = TextEditingController();

  void postCustomers(
      String name, String address, String email, String pocName) {
    dynamic data;
    data = {
      'name': name,
      'address': address,
      'email': email,
      'pocName': pocName,
    };

    NetworkUtils('https://invoicing-kahstlylcq-oa.a.run.app/')
        .postCustomers(data);
    Get.toNamed('/get');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Customers"),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _name,
                    decoration: const InputDecoration(
                        hintText: "Enter Name", labelText: "Name"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                        hintText: "Enter Email", labelText: "Email"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _address,
                    decoration: const InputDecoration(
                        hintText: "Enter Address", labelText: "Address"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextField(
                    controller: _pocName,
                    decoration: const InputDecoration(
                        hintText: "Enter POC Name", labelText: "POC Name"),
                  ),
                ),
                ElevatedButton(
                  child: const Text("Add Customer"),
                  onPressed: () {
                    postCustomers(
                        _name.text, _address.text, _email.text, _pocName.text);
                  },
                ),
              ],
            )));
  }
}
