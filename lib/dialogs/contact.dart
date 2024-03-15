import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void showContactDialog(BuildContext context) {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

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
                Text('Contact',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      color: Colors.red,
                      icon: FaIcon(FontAwesomeIcons.envelope),
                      onPressed: () {
                        // Handle Email action
                      },
                    ),
                    IconButton(
                      color: Colors.blue[700],
                      icon: Icon(Icons.facebook),
                      onPressed: () {
                        // Handle Facebook action
                      },
                    ),
                    IconButton(
                      color: Colors.green[700],
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      onPressed: () {
                        // Handle WhatsApp action
                      },
                    ),
                    IconButton(
                      color: Colors.blue,
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      onPressed: () {
                        // Handle Twitter action
                      },
                    ),
                    IconButton(
                      color: Colors.blue[800],
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () {
                        // Handle LinkedIn action
                      },
                    ),
                  ],
                ),
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
                  controller: _messageController,
                  decoration: InputDecoration(hintText: 'Message'),
                  maxLines: null, // Allows multiline input
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
                        // Get name, email, and message from controllers
                        String name = _nameController.text;
                        String email = _emailController.text;
                        String message = _messageController.text;

                        // Print the data
                        print('Name: $name');
                        print('Email: $email');
                        print('Message: $message');

                        // Close the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text('Send'),
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
