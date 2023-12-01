import 'package:flutter/material.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
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
                "Contact Us",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
        ),
      body: ListView(
        children: [
          _buildTextbox(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 5),
            child: SizedBox(
                width: 200,
                height: 50,
                child: Card(
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )),
          )
        ],
      )
    );
  }
}

Widget _buildTextbox() {
  late String _comments;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xffededed),
            border: Border.all(width: 2, color: Colors.purple),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        height: 350,
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Details',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )),
          //const SizedBox(height: 10),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: 'Let us know the issue',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              validator: (String? value) {
                if (value != null && value.isEmpty) {
                  return 'NA is Required.';
                }
      
                if (!RegExp(r'^[a-zA-Z0-9\s,.!?]+$').hasMatch(value.toString())) {
                  return 'Please enter a valid Comment';
                }
      
                if (value!.length > 500) {
                  return 'Comment should be no more than 500 characters.';
                }
      
                return null;
              },
              onSaved: (String? value) {
                _comments = value.toString();
              },
              maxLength: 500,
              maxLines: 12,
              //maxLines: 5,
            ),
          )),
        ]),
      ),
    );
  }