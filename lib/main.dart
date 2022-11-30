import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:invoice_app/pages/customer/add-customers.dart';
import 'package:invoice_app/pages/customer/customer_page.dart';
import 'package:invoice_app/pages/user/user_page.dart';
import 'package:invoice_app/widget_tree.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => const WidgetTree(),
            transition: Transition.zoom),
        GetPage(
            name: '/add',
            page: () => AddCustomers(),
            transition: Transition.zoom),
        GetPage(
            name: '/profile',
            page: () => const UserPage(),
            transition: Transition.zoom),
        GetPage(
            name: '/get',
            page: () => CustomerPage(),
            transition: Transition.zoom),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}
