//expense page
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
    List<String> buttonLabels = [
        'Food',
        'Groceries',
        'Drinks',
        'Leisure',
        'Personal Care',
        'Bills',
        'Rent',
        'Transportation',
        'Fees',
        ];
    String inputValue = '';
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
                "New Expense",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: GoogleFonts.openSans().fontFamily,
                  fontWeight: FontWeight.bold),
            ),
        ),
          body: Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Expense Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
        padding: const EdgeInsets.all(16),
        child: TextField(
            decoration: InputDecoration(
            labelText: 'Enter Expense',
            border: OutlineInputBorder(),
            ),
            // change value of inputValue when user types
            onChanged: (value) {
              setState(() {
                inputValue = value;
              });
            },
        ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(9, (index) {
              return TextButton(
                onPressed: () {
                // Add your logic for the button's onPressed event here
                },
                style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text(
                buttonLabels[index],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
                ),
            );
            }),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // navigate back to budget page
            Navigator.pop(context, inputValue);
          },
          child: const Text('Add New Expense',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ],
    ),
    );
  }
}