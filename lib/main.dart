import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/help.dart';
import '../screens/home.dart';
import '../screens/update.dart';
import '../screens/account.dart';

import 'schemas/school.dart';
import 'schemas/subject.dart';
import 'schemas/combination.dart';

import 'utils/api_service.dart';
import 'utils/isar_service.dart';

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
  int _selectedIndex = 0;
  var connectivityResult;
  IsarService db = IsarService();
  bool _isDarkModeEnabled = false;
  late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> fetchDataAndStore() async {
    APIService apiService = APIService();
    try {
      final schools = await apiService.fetchData(path: 'school');
      final subjects = await apiService.fetchData(path: 'subject');
      final combinations = await apiService.fetchData(path: 'combination');
      for (var data in subjects['subjects']['data']) {
        var newSubject = Subject()
          ..id = data['id']
          ..name = data['name']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveSubject(newSubject);
      }
      for (var data in schools['schools']['data']) {
        var newSchool = School()
          ..id = data['id']
          ..name = data['name']
          ..contact = data['contact']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveSchool(newSchool);
      }
      for (var data in combinations['combinations']['data']) {
        var newCombination = Combination()
          ..id = data['id']
          ..name = data['name']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveCombination(newCombination);
      }
    } catch (e) {
      print('Error fetching or storing data: $e');
    }
  }

  Future<void> checkConnectivity() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      fetchDataAndStore();
    }
  }

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      Home(onItemTapped: _onItemTapped),
      Update(),
      Help(),
      Account(),
    ];
    checkConnectivity();
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
