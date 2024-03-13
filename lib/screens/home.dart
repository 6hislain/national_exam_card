import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../components/card_with_svg.dart';
import '../components/my_card.dart';
import '../utils/api_service.dart';
import '../utils/db_helper.dart';

class Home extends StatefulWidget {
  final void Function(int index) onItemTapped;

  const Home({super.key, required this.onItemTapped});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  Future<void> fetchDataAndStoreInSQLite() async {
    APIService apiService = APIService();
    DatabaseHelper databaseHelper = DatabaseHelper();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        // Fetch data from the API using APIService
        final Map<String, dynamic> subjects =
            await apiService.fetchData(path: 'subject');
        final Map<String, dynamic> schools =
            await apiService.fetchData(path: 'school');
        final Map<String, dynamic> combination =
            await apiService.fetchData(path: 'combination');

        // Insert data into SQLite using DatabaseHelper
        for (var data in subjects['subjects']['data']) {
          await databaseHelper.insert('subjects', data);
        }

        // await databaseHelper.insert('subjects', (subjects['subjects']['data']));
        // await databaseHelper.insert(
        //     'combinations', (combination['combination']['data']));
        // await databaseHelper.insert('schools', (schools['schools']['data']));
      } catch (e) {
        print('Error fetching or storing data: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataAndStoreInSQLite();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isLoading = false;
      });
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
