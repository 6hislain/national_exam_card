import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/card_with_svg.dart';
import '../components/my_card.dart';
import '../schemas/combination.dart';
import '../schemas/school.dart';
import '../schemas/subject.dart';
import '../utils/isar_service.dart';
import '../utils/provider.dart';

class Home extends ConsumerStatefulWidget {
  final void Function(int index) onItemTapped;

  const Home({super.key, required this.onItemTapped});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  List<School> _schools = [];
  List<Subject> _subjects = [];
  IsarService db = IsarService();
  List<Combination> _combinations = [];

  @override
  void initState() {
    super.initState();
    _schools = ref.read(schoolStateProvider);
    _subjects = ref.read(subjectStateProvider);
    _combinations = ref.read(combinationStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Skeletonizer(
      enabled: _schools.isEmpty || _subjects.isEmpty || _combinations.isEmpty,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Wrap(
          runSpacing: 5,
          alignment: WrapAlignment.center,
          children: [
            CardWithSvg(onItemTapped: widget.onItemTapped),
            Visibility(
              visible: _subjects.isNotEmpty,
              child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subjects (${_subjects.length})',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            // Generate subject cards dynamically
            SizedBox(
                width: screenSize.width * 0.9,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var subject in _subjects)
                            Container(
                              width: screenSize.width / 2.1,
                              child: Card(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Text(subject.name ?? '',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold)))),
                            ),
                        ]))),
            Visibility(
              visible: _combinations.isNotEmpty,
              child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Combinations (${_combinations.length})',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            // Generate combination cards dynamically
            SizedBox(
              width: screenSize.width * 0.9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var combination in _combinations)
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(combination.name ?? ''),
                                  content: Text(combination.description ?? ''),
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
                          },
                          child: Text(
                            combination.name ?? '',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _schools.isNotEmpty,
              child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Schools (${_schools.length})',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            // Generate school cards dynamically
            SizedBox(
                width: screenSize.width * 0.9,
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var school in _schools)
                            Container(
                              width: screenSize.width / 2.1,
                              child: Card(
                                  child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        children: [
                                          Text(school.name ?? '',
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold)),
                                          ElevatedButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title:
                                                        Text(school.name ?? ''),
                                                    content: Text(
                                                        school.description ??
                                                            ''),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Text('Open'),
                                          ),
                                        ],
                                      ))),
                            ),
                        ]))),
          ],
        ),
      ),
    );
  }
}
