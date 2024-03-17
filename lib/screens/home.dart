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
                      'Subject',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            // Generate subject cards dynamically
            for (var subject in _subjects)
              Container(
                width: screenSize.width / 2.1,
                child: MyCard(title: subject.name ?? '', subtitle: ''),
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
                      'School',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
            ),
            // Generate school cards dynamically
            for (var school in _schools)
              Container(
                width: screenSize.width / 2.1,
                child: MyCard(title: school.name ?? '', subtitle: ''),
              ),
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
                      'Combination',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
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
