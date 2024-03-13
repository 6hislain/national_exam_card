import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;

  MyCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlainCard extends StatelessWidget {
  final String title;
  final String subtitle;
  Widget action;

  PlainCard(
      {required this.title,
      required this.subtitle,
      this.action = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          action,
        ],
      ),
    );
  }
}
