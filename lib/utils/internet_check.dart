import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

// TODO: check internet, if table is empty { download books, bible versions }

class InternetChecker extends StatefulWidget {
  @override
  _InternetCheckerState createState() => _InternetCheckerState();
}

class _InternetCheckerState extends State<InternetChecker> {
  var connectivityResult;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print('No internet connection.');
    } else {
      print('Internet connection available.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      connectivityResult == ConnectivityResult.none
          ? 'No internet connection.'
          : 'Internet connection available.',
    );
  }
}
