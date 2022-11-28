import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:invoice_app/auth.dart';

import '../utils/backend.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  final box = GetStorage();

  dynamic tokenId;
  var transactionsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    init();
  }

  void init() async {
    tokenId = box.read('tokenid');

    var transactionsDataTemp =
        await NetworkUtils('https://invoicing-kahstlylcq-oa.a.run.app/')
            .getSingleTransactions();
    setState(() {
      transactionsData = transactionsDataTemp;
    });
    print("transactionsData");
    print(transactionsData);
    print("transactionsData");
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    print("user");
    print(box.read('tokenid'));
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(user?.email ?? 'User email'),
          ),
          Container(child: Text(tokenId)),
        ],
      ),
    );
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: ListView.builder(
          itemCount:
              transactionsData != null ? transactionsData['data']!.length : 0,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text("Invoice Number : " +
                    transactionsData['data'][index]['invoice_number']),
                subtitle:
                    Text("Date : " + transactionsData['data'][index]['date']),
              ),
            );
          },
        ));
  }
}
