import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/my_card.dart';

import '../dialogs/login.dart';
import '../dialogs/contact.dart';
import '../dialogs/register.dart';
import '../dialogs/application.dart';

import '../schemas/user.dart';
import '../utils/provider.dart';

class Account extends ConsumerStatefulWidget {
  const Account({super.key});

  @override
  ConsumerState<Account> createState() => _AccountState();
}

class _AccountState extends ConsumerState<Account> {
  bool _eventSwitchValue = false;
  bool _notificationSwitchValue = false;

  void _setUser(User user) {
    ref.read(userStateProvider.notifier).state = user;
  }

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
                      showLoginDialog(context, _setUser);
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplyDialog()),
                            );
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

  void showCustomizeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Customize',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: _eventSwitchValue,
                        onChanged: (value) {
                          setState(() {
                            _eventSwitchValue = value!;
                          });
                        },
                      ),
                      Text('Show calendar events'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Checkbox(
                        value: _notificationSwitchValue,
                        onChanged: (value) {
                          setState(() {
                            _notificationSwitchValue = value!;
                          });
                        },
                      ),
                      Text('Get notifications'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Close the dialog
                          Navigator.of(context).pop();
                        },
                        child: Text('Apply'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
