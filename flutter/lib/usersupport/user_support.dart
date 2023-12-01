import 'package:flutter/material.dart';
import 'package:soen357_project/usersupport/contact_us.dart';

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
    return Scaffold(
        appBar: AppBar(
        title: const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
        ),
      body: ListView(
        children: [
          _settingsRow(
            context,
            Icon(Icons.person, size: 28, color: Colors.purple.shade200),
            "Profile",
            "Edit profile settings here"
          ),
          const Divider(),
          GestureDetector(
            child: _settingsRow(
              context,
              Icon(Icons.chat_bubble, size: 28, color: Colors.purple.shade400),
              "Contact Us",
              "If you are facing issues with the app"
            ),
            onTap:() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactUsPage())
              );
            },
          ),
          const Divider(),
          _settingsRow(
            context,
            Icon(Icons.star, size: 28, color: Colors.purple.shade700),
            "Feedback",
            "Let us know what we can do better"
          ),
          const Divider(),
          _settingsRow(
            context,
            Icon(Icons.settings, size: 28, color: Colors.purple.shade900),
            "Settings",
            "Change app settings here"
          ),
        ],
      )
    );
  }
}

Widget _settingsRow(BuildContext context, Icon icon, String text, String description) {
  return Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            icon,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                        text,
                                        style: const TextStyle(
                                            fontSize: 18))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                        description,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey.shade600)))
                            ]),
                          ])
                    ]));
}