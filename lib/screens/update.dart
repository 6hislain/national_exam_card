import 'package:flutter/material.dart';

import '../components/my_card.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(5),
        child: Wrap(runSpacing: 5, alignment: WrapAlignment.center, children: [
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Student Exam Card Application',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Calendar Events',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marks', style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Past Papers',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "SG Remera", subtitle: '...')),
        ]));
  }
}
