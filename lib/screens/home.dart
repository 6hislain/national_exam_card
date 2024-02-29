import 'package:flutter/material.dart';

import '../components/card_with_svg.dart';
import '../components/my_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5),
      child: Wrap(runSpacing: 5, alignment: WrapAlignment.center, children: [
        CardWithSvg(),
        SizedBox(
            height: 30,
            width: screenSize.width * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject', style: Theme.of(context).textTheme.bodyLarge)
                ])),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "English", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "Chemistry", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "Biology", subtitle: '...')),
        SizedBox(
            height: 30,
            width: screenSize.width * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('School', style: Theme.of(context).textTheme.bodyLarge)
                ])),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "APAPER", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "SG Remera", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "UNILAK", subtitle: '...')),
        SizedBox(
            height: 30,
            width: screenSize.width * 0.9,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Combination',
                      style: Theme.of(context).textTheme.bodyLarge)
                ])),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "A", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "C", subtitle: '...')),
        Container(
            width: screenSize.width / 2.1,
            child: MyCard(title: "D", subtitle: '...')),
      ]),
    );
  }
}
