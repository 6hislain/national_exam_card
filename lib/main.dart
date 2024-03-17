import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:national_exam_card/utils/provider.dart';

import '../screens/help.dart';
import '../screens/home.dart';
import '../screens/update.dart';
import '../screens/account.dart';

import 'schemas/mark.dart';
import 'schemas/paper.dart';
import 'schemas/school.dart';
import 'schemas/subject.dart';
import 'schemas/combination.dart';
import 'schemas/application.dart';
import 'schemas/notification.dart';
import 'schemas/calendar_event.dart';

import 'utils/api_service.dart';
import 'utils/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
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
      final marks = await apiService.fetchData(path: 'marks');
      final papers = await apiService.fetchData(path: 'paper');
      final schools = await apiService.fetchData(path: 'school');
      final subjects = await apiService.fetchData(path: 'subject');
      final calendarEvents = await apiService.fetchData(path: 'calendar');
      final applications = await apiService.fetchData(path: 'application');
      final combinations = await apiService.fetchData(path: 'combination');
      final notifications = await apiService.fetchData(path: 'notification');

      for (var data in marks['marks']['data']) {
        var newMark = Mark()
          ..id = data['id']
          ..year = data['year']
          ..marks = data['marks']
          ..semester = data['semester']
          ..createdAt = DateTime.parse(data['created_at'])
          ..subjectId = data['subject_id']
          ..studentId = data['student_id']
          ..userId = data['user_id'];
        await db.saveMark(newMark);

        final List<Mark> thisList = ref.read(markStateProvider);
        ref.read(markStateProvider.notifier).state = [...thisList, newMark];
      }
      for (var data in papers['papers']['data']) {
        var newPaper = Paper()
          ..id = data['id']
          ..name = data['name']
          ..document = data['document']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.savePaper(newPaper);

        final List<Paper> thisList = ref.read(paperStateProvider);
        ref.read(paperStateProvider.notifier).state = [...thisList, newPaper];
      }
      for (var data in applications['applications']['data']) {
        var newApplication = Application()
          ..id = data['id']
          ..firstName = data['first_name']
          ..lastName = data['last_name']
          ..gender = data['gender']
          ..status = data['status']
          ..city = data['city']
          ..father = data['father']
          ..mother = data['mother']
          ..nationality = data['nationality']
          ..contactPerson = data['contact_person']
          ..contactDetails = data['contact_details']
          ..description = data['description']
          ..approved = data['approved']
          ..dob = DateTime.parse(data['dob'])
          ..createdAt = DateTime.parse(data['created_at'])
          ..combinationId = data['combination_id']
          ..schoolId = data['school_id']
          ..userId = data['user_id'];
        await db.saveApplication(newApplication);

        final List<Application> thisList = ref.read(applicationStateProvider);
        ref.read(applicationStateProvider.notifier).state = [
          ...thisList,
          newApplication
        ];
      }
      for (var data in notifications['notifications']['data']) {
        var newNotification = Notifications()
          ..id = data['id']
          ..title = data['title']
          ..url = data['url']
          ..content = data['content']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveNotification(newNotification);

        final List<Notifications> thisList =
            ref.read(notificationStateProvider);
        ref.read(notificationStateProvider.notifier).state = [
          ...thisList,
          newNotification
        ];
      }
      for (var data in calendarEvents['events']['data']) {
        var newCalendarEvent = CalendarEvent()
          ..id = data['id']
          ..name = data['name']
          ..stop = data['stop']
          ..start = data['start']
          ..color = data['color']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveCalendarEvent(newCalendarEvent);

        final List<CalendarEvent> thisList = ref.read(eventStateProvider);
        ref.read(eventStateProvider.notifier).state = [
          ...thisList,
          newCalendarEvent
        ];
      }

      for (var data in subjects['subjects']['data']) {
        var newSubject = Subject()
          ..id = data['id']
          ..name = data['name']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveSubject(newSubject);

        final List<Subject> thisList = ref.read(subjectStateProvider);
        ref.read(subjectStateProvider.notifier).state = [
          ...thisList,
          newSubject
        ];
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

        final List<School> thisList = ref.read(schoolStateProvider);
        ref.read(schoolStateProvider.notifier).state = [...thisList, newSchool];
      }
      for (var data in combinations['combinations']['data']) {
        var newCombination = Combination()
          ..id = data['id']
          ..name = data['name']
          ..description = data['description']
          ..createdAt = DateTime.parse(data['created_at'])
          ..userId = data['user_id'];
        await db.saveCombination(newCombination);

        final List<Combination> thisList = ref.read(combinationStateProvider);
        ref.read(combinationStateProvider.notifier).state = [
          ...thisList,
          newCombination
        ];
      }
    } catch (e) {
      print('Error fetching or storing data: $e');
    }
  }

  Future<void> checkConnectivity() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ref.read(schoolStateProvider.notifier).state = await db.getSchools();
      ref.read(subjectStateProvider.notifier).state = await db.getSubjects();
      ref.read(combinationStateProvider.notifier).state =
          await db.getCombinations();
    } else {
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
