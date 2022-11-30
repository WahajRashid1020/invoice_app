import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/model/customer_model.dart';

import '../../utils/backend.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final box = GetStorage();

  static Future<List<Customer>> customersFuture = getCustomer();
  @override
  static Future<List<Customer>> getCustomer() async {
    var customersData =
        await NetworkUtils('https://invoicing-kahstlylcq-oa.a.run.app/')
            .getCustomers();

    final List<dynamic> data = customersData.data["data"] ?? [];
    return data.map((dynamic e) => Customer.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Customers")),
      body: Center(
        child: FutureBuilder<List<Customer>>(
            future: customersFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final customers = snapshot.data!;
                return buildCustomer(customers);
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Widget buildCustomer(List<Customer> customers) => ListView.builder(
      itemCount: customers.length,
      itemBuilder: (context, index) {
        final customer = customers[index];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              child: ListTile(
                title: Text("Name : ${customer.name}"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Email : ${customer.email}"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Address : ${customer.address}"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("POC : ${customer.pocName}"),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Initials : ${customer.initials}"),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit), onPressed: () => null),
                  IconButton(
                      icon: const Icon(Icons.delete), onPressed: () => null),
                ],
              ),
            ),
          ],
        );
      });
}
