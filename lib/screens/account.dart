import 'package:flutter/material.dart';

import '../components/my_card.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5),
      child: Wrap(
        children: [
          Wrap(alignment: WrapAlignment.center, runSpacing: 10, children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/img/user.png'),
              radius: 50,
            ),
            Container(
                width: screenSize.width,
                child: Center(
                    child: Text(
                  'User',
                  style: Theme.of(context).textTheme.titleLarge,
                ))),
            Container(
                width: screenSize.width,
                child: Center(
                    child: Text(
                  'Email',
                  style: Theme.of(context).textTheme.titleMedium,
                ))),
            ElevatedButton(
              child: Text('Edit Profile'),
              onPressed: () {},
            )
          ]),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Options',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(
                  title: "Apply for the exam card",
                  subtitle: 'Submit your exam card application')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(
                  title: "Notifications",
                  subtitle: 'Customize my emails, app notifications')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(
                  title: "Get in touch",
                  subtitle: 'Contact us, report an issue, live support')),
        ],
      ),
    );
  }
}
