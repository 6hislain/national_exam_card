import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:national_exam_card/utils/provider.dart';

import '../components/my_card.dart';

import '../schemas/application.dart';
import '../schemas/mark.dart';
import '../schemas/paper.dart';
import '../schemas/notification.dart';
import '../schemas/calendar_event.dart';

import '../utils/isar_service.dart';

class Update extends ConsumerStatefulWidget {
  const Update({super.key});

  @override
  ConsumerState<Update> createState() => _UpdateState();
}

class _UpdateState extends ConsumerState<Update> {
  IsarService db = IsarService();
  List<Mark> _marks = [];
  List<Paper> _papers = [];
  List<CalendarEvent> _events = [];
  List<Application> _applications = [];
  List<Notifications> _notifications = [];

  @override
  void initState() {
    super.initState();
    _marks = ref.read(markStateProvider);
    _papers = ref.read(paperStateProvider);
    _events = ref.read(eventStateProvider);
    _applications = ref.read(applicationStateProvider);
    _applications = ref.read(applicationStateProvider);
    _notifications = ref.read(notificationStateProvider);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(5),
        child: Wrap(runSpacing: 5, alignment: WrapAlignment.center, children: [
          Visibility(
            visible: _applications.isNotEmpty,
            child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Student Exam Card Application',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ])),
          ),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Simon", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Paul", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Elene", subtitle: '...')),
          Visibility(
            visible: _events.isNotEmpty,
            child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Calendar Events',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ])),
          ),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Exam Day", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chrismas", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Math Contest", subtitle: '...')),
          Visibility(
            visible: _marks.isNotEmpty,
            child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Marks',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ])),
          ),
          for (var mark in _marks)
            Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: '${mark.marks}', subtitle: '${mark.year}'),
            ),
          Visibility(
            visible: _papers.isNotEmpty,
            child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Past Papers',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ])),
          ),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "English 2022", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Biology 2012", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chemistry 2022", subtitle: '...')),
          Visibility(
            visible: _notifications.isNotEmpty,
            child: SizedBox(
                height: 30,
                width: screenSize.width * 0.9,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notifications',
                          style: Theme.of(context).textTheme.bodyLarge)
                    ])),
          ),
          for (var application in _applications)
            Container(
              width: screenSize.width / 2.1,
              child: MyCard(
                  title: '${application.firstName}',
                  subtitle: '${application.lastName}'),
            ),
        ]));
  }
}
