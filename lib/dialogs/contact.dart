import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

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
                      onPressed: () async {
                        await _launchURL('mailto:info@necams.com');
                      },
                    ),
                    IconButton(
                      color: Colors.blue[700],
                      icon: Icon(Icons.facebook),
                      onPressed: () async {
                        await _launchURL('https://fb.me/necams');
                      },
                    ),
                    IconButton(
                      color: Colors.green[700],
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      onPressed: () async {
                        await _launchURL('https://wa.me/250785102285');
                      },
                    ),
                    IconButton(
                      color: Colors.blue,
                      icon: FaIcon(FontAwesomeIcons.twitter),
                      onPressed: () async {
                        await _launchURL('https://x.com/necams');
                      },
                    ),
                    IconButton(
                      color: Colors.blue[800],
                      icon: FaIcon(FontAwesomeIcons.linkedin),
                      onPressed: () async {
                        await _launchURL('https://linkedin.com/in/necams');
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
                  maxLines: null,
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
