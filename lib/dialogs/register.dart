import 'dart:convert';
import 'package:flutter/material.dart';
import '../schemas/user.dart';
import '../utils/api_service.dart';

void showRegisterDialog(
    BuildContext context, void Function(User) setUser) async {
  APIService apiService = APIService();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Register',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        String name = _nameController.text.trim();
                        String email = _emailController.text.trim();
                        String password = _passwordController.text.trim();
                        String confirmPassword =
                            _confirmPasswordController.text.trim();

                        if (name.isEmpty ||
                            email.isEmpty ||
                            password.isEmpty ||
                            confirmPassword.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Warning'),
                                content:
                                    Text('Fill in all the required fields.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        if (password != confirmPassword) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Warning'),
                                content: Text("Passwords don't match."),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        var response = await apiService.postData(
                            path: 'signup',
                            data: {
                              'name': name,
                              'email': email,
                              'password': password
                            });

                        try {
                          Map<String, dynamic> data = jsonDecode(response.body);

                          var user = User()
                            ..id = data['user']['id']
                            ..name = data['user']['name']
                            ..email = data['user']['email']
                            ..image = data['user']['image']
                            ..role = data['user']['role'];

                          setUser(user);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Thank you for joining ${user.name}!'),
                              duration: Duration(
                                  seconds: 3), // Adjust duration as needed
                            ),
                          );
                        } catch (e) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Warning'),
                                content: Text('Sign up failed, try again.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          return;
                        }

                        Navigator.of(context).pop();
                      },
                      child: Text('Register'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
