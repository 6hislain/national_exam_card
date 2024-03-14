import 'package:flutter/material.dart';

void showApplicationDialog(BuildContext context) {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Apply'),
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
