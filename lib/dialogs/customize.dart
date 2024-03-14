import 'package:flutter/material.dart';

void showCustomizeDialog(BuildContext context) {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Customize'),
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
