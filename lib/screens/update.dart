import 'package:flutter/material.dart';

import '../components/my_card.dart';
import '../schemas/application.dart';
import '../schemas/mark.dart';
import '../schemas/paper.dart';
import '../schemas/notification.dart';
import '../schemas/calendar_event.dart';
import '../utils/isar_service.dart';

class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  IsarService db = IsarService();
  List<Application> _applications = [];
  List<Notifications> _notifications = [];
  List<Mark> _marks = [];
  List<Paper> _papers = [];
  List<CalendarEvent> _events = [];

  Future<void> fetchDataFromDatabase() async {
    var marks = await db.getMarks();
    var papers = await db.getPapers();
    var events = await db.getCalendarEvents();
    var applications = await db.getApplications();
    var notifications = await db.getNotifications();

    setState(() {
      _marks = marks;
      _papers = papers;
      _events = events;
      _applications = applications;
      _notifications = notifications;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(5),
        child: Wrap(runSpacing: 5, alignment: WrapAlignment.center, children: [
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Student Exam Card Application',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Simon", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Paul", subtitle: '...')),
          Container(
              width: screenSize.width / 0.9,
              child: MyCard(title: "Elene", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Calendar Events',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Exam Day", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chrismas", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Math Contest", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marks', style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          for (var mark in _marks)
            Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: '${mark.marks}', subtitle: '${mark.year}'),
            ),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Past Papers',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "English 2022", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Biology 2012", subtitle: '...')),
          Container(
              width: screenSize.width / 2.1,
              child: MyCard(title: "Chemistry 2022", subtitle: '...')),
          SizedBox(
              height: 30,
              width: screenSize.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Notifications',
                        style: Theme.of(context).textTheme.bodyLarge)
                  ])),
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
