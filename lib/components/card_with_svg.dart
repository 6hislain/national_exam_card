import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../dialogs/application.dart';
import '../schemas/user.dart';
import '../utils/provider.dart';

class CardWithSvg extends ConsumerStatefulWidget {
  final void Function(int index) onItemTapped;

  const CardWithSvg({
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CardWithSvgState();
}

class _CardWithSvgState extends ConsumerState<CardWithSvg> {
  User _user = User();

  @override
  void initState() {
    super.initState();
    _user = ref.read(userStateProvider);
  }

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
                  _user.id == null
                      ? Container()
                      : TextButton(
                          child: Text('Apply today'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ApplyDialog()),
                            );
                          }),
                  TextButton(
                      child: Text('Read more'),
                      onPressed: () {
                        widget.onItemTapped(2);
                      }),
                ]),
          )
        ],
      ),
    );
  }
}
