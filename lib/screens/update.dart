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
              child: MyCard(title: "Simon", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Paul", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Elene", subtitle: '...')),
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
              child: MyCard(title: "Exam Day", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chrismas", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Math Contest", subtitle: '...')),
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
              child: MyCard(title: "Peter", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "George", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "John", subtitle: '...')),
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
              child: MyCard(title: "English 2022", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Biology 2012", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chemistry 2022", subtitle: '...')),
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
              child: MyCard(title: "Application approved", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Welcome to the app", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child:
                  MyCard(title: "Thank you for registering", subtitle: '...')),
        ]));
  }
}
