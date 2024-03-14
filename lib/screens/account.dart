import 'package:flutter/material.dart';

import '../components/my_card.dart';

import '../dialogs/login.dart';
import '../dialogs/contact.dart';
import '../dialogs/register.dart';
import '../dialogs/customize.dart';
import '../dialogs/application.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      showLoginDialog(context);
                    },
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      showRegisterDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ]),
          Container(
              width: screenSize.width / 0.9,
              child: PlainCard(
                  title: "Apply for the exam card",
                  subtitle:
                      'Submit your exam card application to eligible for the national exam',
                  action: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text('Apply today'),
                          onPressed: () {
                            showApplicationDialog(context);
                          }),
                    ],
                  ))),
          Container(
              width: screenSize.width / 2.1,
              child: PlainCard(
                  title: "Notifications",
                  subtitle: 'Customize my emails, app notifications',
                  action: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text('Customize'),
                          onPressed: () {
                            showCustomizeDialog(context);
                          }),
                    ],
                  ))),
          Container(
              width: screenSize.width / 2.1,
              child: PlainCard(
                  title: "Get in touch",
                  subtitle: 'Contact us, report an issue, live support',
                  action: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          child: Text('Contact'),
                          onPressed: () {
                            showContactDialog(context);
                          }),
                    ],
                  ))),
        ],
      ),
    );
  }
}
