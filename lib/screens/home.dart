import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/card_with_svg.dart';
import '../components/my_card.dart';
import '../schemas/combination.dart';
import '../schemas/school.dart';
import '../schemas/subject.dart';
import '../utils/api_service.dart';
import '../utils/isar_service.dart';

class Home extends StatefulWidget {
  final void Function(int index) onItemTapped;

  const Home({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  var connectivityResult;
  IsarService db = IsarService();
  List<School> _schools = [];
  List<Subject> _subjects = [];
  List<Combination> _combinations = [];

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

  Future<void> fetchDataFromDatabase() async {
    var schools = await db.getSchools();
    var subjects = await db.getSubjects();
    var combinations = await db.getCombinations();
    setState(() {
      _schools = schools;
      _subjects = subjects;
      _combinations = combinations;
      _isLoading = false;
    });
  }

  Future<void> checkConnectivity() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      fetchDataFromDatabase();
    } else {
      fetchDataAndStore().then((_) {
        fetchDataFromDatabase();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Skeletonizer(
      enabled: _isLoading,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Wrap(
          runSpacing: 5,
          alignment: WrapAlignment.center,
          children: [
            CardWithSvg(onItemTapped: widget.onItemTapped),
            SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subject',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            // Generate subject cards dynamically
            for (var subject in _subjects)
              Container(
                width: screenSize.width / 2.1,
                child: MyCard(title: subject.name ?? '', subtitle: ''),
              ),
            SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'School',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            // Generate school cards dynamically
            for (var school in _schools)
              Container(
                width: screenSize.width / 2.1,
                child: MyCard(title: school.name ?? '', subtitle: ''),
              ),
            SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Combination',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            // Generate combination cards dynamically
            for (var combination in _combinations)
              Container(
                width: screenSize.width / 2.1,
                child: MyCard(title: combination.name ?? '', subtitle: ''),
              ),
          ],
        ),
      ),
    );
  }
}
