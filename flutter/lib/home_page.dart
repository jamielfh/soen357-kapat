import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soen357_project/analytics/analytics.dart';
import 'package:soen357_project/budget/budget.dart';
import 'package:soen357_project/education/education.dart';
import 'package:soen357_project/goalsetting/goal_setting.dart';
import 'package:soen357_project/usersupport/user_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
                "Home Page",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserSupportPage()),
                  );
                },
              ),
            ]
      ),
      body: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                // User welcome message
                const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Text(
                      "Welcome back, user!",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),

                // Rows & columns to simulate a grid of page icons
                // 1 row has 2 page icons
                Row(
                  children: [
                    IconButton(
                      splashRadius: 100,
                      iconSize: 180,
                      icon: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const BudgetPage()
                                      )
                              );
                          }
                        ),
                      ),
                      onPressed: () {
                        // Not required as image buttons have their own Navigators
                      },
                    ),
                    IconButton(
                      splashRadius: 100,
                      iconSize: 180,
                      icon: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                            const GoalSettingPage()
                                      )
                              );
                          }
                        ),
                      ),
                      onPressed: () {
                        // Not required as image buttons have their own Navigators
                      },
                    ),
                  ],
                ), 
                Row(
                  children: [
                    IconButton(
                      splashRadius: 100,
                      iconSize: 180,
                      icon: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const EducationPage()
                                      )
                              );
                          }
                        ),
                      ),
                      onPressed: () {
                        // Not required as image buttons have their own Navigators
                      },
                    ),
                    IconButton(
                      splashRadius: 100,
                      iconSize: 180,
                      icon: Ink(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))
                        ),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 2.5,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(30),
                          onTap: () {
                              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                            const AnalyticsPage()
                                      )
                              );
                          }
                        ),
                      ),
                      onPressed: () {
                        // Not required as image buttons have their own Navigators
                      },
                    ),
                  ],
                ),
      ]// This trailing comma makes auto-formatting nicer for build methods.
    ));
  }
}