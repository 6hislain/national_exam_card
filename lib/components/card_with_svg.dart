import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWithSvg extends StatelessWidget {
  final void Function(int index) onItemTapped;

  const CardWithSvg({
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text('National Exam Card App'),
                  subtitle: Text(
                      'Welcome to the app! Apply for your exam card, keep up with the latest updates'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/img/students.svg', // Replace 'assets/icon.svg' with your SVG file path
                  width: 75,
                  height: 75,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      child: Text('Apply today'),
                      onPressed: () {
                        onItemTapped(3);
                      }),
                  TextButton(
                      child: Text('Read more'),
                      onPressed: () {
                        onItemTapped(2);
                      }),
                ]),
          )
        ],
      ),
    );
  }
}
