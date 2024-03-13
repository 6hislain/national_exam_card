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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      _showLoginDialog(context);
                    },
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {
                      _showRegisterDialog(context);
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //     width: screenSize.width,
            //     child: Center(
            //         child: Text(
            //       'User',
            //       style: Theme.of(context).textTheme.titleLarge,
            //     ))),
            // Container(
            //     width: screenSize.width,
            //     child: Center(
            //         child: Text(
            //       'Email',
            //       style: Theme.of(context).textTheme.titleMedium,
            //     ))),
            // ElevatedButton(
            //   child: Text('Edit Profile'),
            //   onPressed: () {},
            // )
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
                      TextButton(child: Text('Apply today'), onPressed: () {}),
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
                      TextButton(child: Text('Customize'), onPressed: () {}),
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
                      TextButton(child: Text('Contact'), onPressed: () {}),
                    ],
                  ))),
        ],
      ),
    );
  }

  void _showLoginDialog(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get email and password from controllers
                String email = _emailController.text;
                String password = _passwordController.text;

                // Validate email and password
                // You can implement your validation logic here

                // For now, just print the email and password
                print('Email: $email');
                print('Password: $password');

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Login'),
            ),
          ],
        );
      },
    );
  }

  void _showRegisterDialog(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(hintText: 'Confirm Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Get name, email, password, and confirm password from controllers
                String name = _nameController.text;
                String email = _emailController.text;
                String password = _passwordController.text;
                String confirmPassword = _confirmPasswordController.text;

                // Validate inputs (e.g., check if email is valid, password matches confirm password, etc.)
                // For simplicity, I'm skipping validation in this example.

                // For now, just print the name, email, and password
                print('Name: $name');
                print('Email: $email');
                print('Password: $password');

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Register'),
            ),
          ],
        );
      },
    );
  }
}
