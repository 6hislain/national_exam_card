import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/help.dart';
import '../screens/home.dart';
import '../screens/update.dart';
import '../screens/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkModeEnabled = false;
  int _selectedIndex = 0;

  static const List _widgetOptions = [
    Home(),
    Update(),
    Help(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'National Exam Card',
      debugShowCheckedModeBanner: false,
      theme: _isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('NECAMS'),
          actions: [
            IconButton(
              icon: Icon(Icons.dark_mode),
              onPressed: () {
                setState(() {
                  _isDarkModeEnabled = !_isDarkModeEnabled;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Updates',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: 'Help',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
