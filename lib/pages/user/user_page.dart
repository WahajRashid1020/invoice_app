import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/auth.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressrController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("User Profile"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                        user?.photoURL == null
                            ? 'https://googleflutter.com/sample_image.jpg'
                            : user?.photoURL ?? "photoURL",
                      ),
                      fit: BoxFit.fill),
                ),
              ),
              title: user?.displayName == ""
                  ? TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          labelText: 'Name',
                          hintText: 'Enter Your Name'),
                    )
                  : Text(
                      user?.displayName ?? "Display Name",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
              subtitle: const Text(
                "Code Clan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 170,
                    height: 100,
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[350],
                        elevation: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            user?.phoneNumber == ""
                                ? SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: TextField(
                                      controller: numberController,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          labelText: 'Phone Number',
                                          labelStyle: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.red),
                                          hintText: 'Enter Phone Number'),
                                    ))
                                : ListTile(
                                    title: const Text('Phone Number',
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.red)),
                                    subtitle: Text(
                                        user?.phoneNumber ?? 'Phone Number',
                                        style: const TextStyle(fontSize: 10.0)),
                                  ),
                          ],
                        ))),
                Container(
                    width: 170,
                    height: 100,
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[350],
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            user?.email == ""
                                ? SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: TextField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          labelText: 'Email',
                                          labelStyle: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.red),
                                          hintText: 'Enter Email'),
                                    ))
                                : ListTile(
                                    title: const Text('Email',
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.red)),
                                    subtitle: Text(user?.email ?? 'Email',
                                        style: const TextStyle(fontSize: 10.0)),
                                  ),
                          ],
                        ))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 350,
                    height: 100,
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[350],
                        elevation: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            user?.email == ""
                                ? SizedBox(
                                    height: 40,
                                    width: 100,
                                    child: TextField(
                                      controller: addressrController,
                                      decoration: const InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 0, vertical: 0),
                                          labelText: 'Address',
                                          labelStyle: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.red),
                                          hintText: 'Enter Address'),
                                    ))
                                : ListTile(
                                    title: const Text('Address',
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.red)),
                                    subtitle: Text(user?.email ?? 'Adress',
                                        style: const TextStyle(fontSize: 10.0)),
                                  ),
                          ],
                        ))),
              ],
            ),
            _signOutButton(),
          ],
        ),
      ),
    );
  }
}
