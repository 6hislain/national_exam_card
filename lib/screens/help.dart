import 'package:flutter/material.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  String _selected = 'Get Started';
  List<String> _items = [
    'Get Started',
    'My Account',
    'Apply for Exam Card',
    'Report an Issue',
    'Examination Center',
    'Exam Results',
    'Claim Marks',
    'Academic Calendar',
    'Frequently Asked Questions',
    'Privacy Policy',
    'Terms & Conditions',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _selected = _items[index];
          });
        },
        children: _items.map<ExpansionPanel>((String item) {
          int index = _items.indexOf(item);
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  item,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Content related to $item',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            isExpanded: _items[index] == _selected,
          );
        }).toList(),
      ),
    );
  }
}

class Item {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(
    numberOfItems,
    (int index) => Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    ),
  );
}
