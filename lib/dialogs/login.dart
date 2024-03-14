import 'package:flutter/material.dart';

void showLoginDialog(BuildContext context) {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Login',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    ])
              ],
            ),
          ),
        ),
      );
    },
  );
}
