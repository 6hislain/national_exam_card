import 'package:flutter/material.dart';

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

                        // Send the message via WhatsApp or email
                        _sendMessage(name, email, message);
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

void _sendMessage(String name, String email, String message) async {
  // Construct WhatsApp link
  String whatsAppLink =
      'https://wa.me/?text=Name:%20$name%0AEmail:%20$email%0AMessage:%20$message';
  // Construct email link
  String emailLink =
      'mailto:$email?subject=Contact%20Message&body=Name:%20$name%0AEmail:%20$email%0AMessage:%20$message';
}
