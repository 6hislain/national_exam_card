import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/card_with_svg.dart';
import '../components/my_card.dart';
import '../schemas/combination.dart';
import '../schemas/school.dart';
import '../utils/api_service.dart';
import '../utils/isar_service.dart';
import '../schemas/subject.dart';

class Home extends StatefulWidget {
  final void Function(int index) onItemTapped;

  const Home({Key? key, required this.onItemTapped}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;
  IsarService db = IsarService();
  List<Map<String, dynamic>> _subjects = [];

  Future<void> fetchDataAndStoreInSQLite() async {
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
      // for (var data in schools['schools']['data']) {
      //   var newSchool = School()
      //     ..id = data['id']
      //     ..name = data['name']
      //     ..description = data['description']
      //     ..createdAt = DateTime.parse(data['created_at'])
      //     ..userId = data['user_id'];
      //   await db.saveSchool(newSchool);
      // }
      // for (var data in combinations['combinations']['data']) {
      //   var newCombination = Combination()
      //     ..id = data['id']
      //     ..name = data['name']
      //     ..description = data['description']
      //     ..createdAt = DateTime.parse(data['created_at'])
      //     ..userId = data['user_id'];
      //   await db.saveCombination(newCombination);
      // }
    } catch (e) {
      print('Error fetching or storing data: $e');
    }
  }

  Future<void> fetchSubjectsFromDatabase() async {
    var subjects = await db.getSubjects();
    print(subjects);
    setState(() {
      _subjects = subjects.cast<Map<String, dynamic>>();
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndStoreInSQLite().then((_) {
      fetchSubjectsFromDatabase();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Skeletonizer(
      enabled: _isLoading,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Wrap(runSpacing: 5, alignment: WrapAlignment.center, children: [
          CardWithSvg(onItemTapped: widget.onItemTapped),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Subject',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "English", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chemistry", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Biology", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('School', style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "APAPER", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "SG Remera", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "UNILAK", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Combination',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "A", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "C", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "D", subtitle: '...')),
        ]),
      ),
    );
  }
}
