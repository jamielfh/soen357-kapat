import 'package:flutter/material.dart';

class UserSupportPage extends StatefulWidget {
  const UserSupportPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<UserSupportPage> createState() => _UserSupportPageState();
}

class _UserSupportPageState extends State<UserSupportPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return const Scaffold(
      body: Text("User Support Page")
    );
  }
}