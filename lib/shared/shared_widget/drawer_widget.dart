// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';

class DrawerWidget extends StatefulWidget {
  Widget divisionOne;
  Widget groupOne;
  Widget groupTwo;
  DrawerWidget({
    Key? key,
    required this.divisionOne,
    required this.groupOne,
    required this.groupTwo,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool isD2Choosen = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GrediantBackgroundWidget(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(100, 80),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: SharedColors.UnSelectedIconColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Premier League',
                        style: SharedFonts.whiteFont,
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return widget.divisionOne;
                    }),
                  );
                },
              ),
              Container(
                height: isD2Choosen ? 180 : 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: SharedColors.UnSelectedIconColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Second Division League',
                              style: SharedFonts.whiteFont,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        isD2Choosen = !isD2Choosen;
                        setState(() {});
                      },
                    ),
                    if (isD2Choosen)
                      TextButton(
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: SharedColors.UnSelectedIconColor,
                            ),
                            Text(
                              'Group 1',
                              style: SharedFonts.whiteFont,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return widget.groupOne;
                            }),
                          );
                        },
                      ),
                    if (isD2Choosen)
                      TextButton(
                        style: TextButton.styleFrom(minimumSize: Size(100, 40)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.arrow_circle_right_outlined,
                              color: SharedColors.UnSelectedIconColor,
                            ),
                            Text(
                              'Group 2',
                              style: SharedFonts.whiteFont,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return widget.groupTwo;
                            }),
                          );
                        },
                      ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: SharedColors.UnSelectedIconColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'El-Rokn League Cup',
                        style: SharedFonts.whiteFont,
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: SharedColors.UnSelectedIconColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Champions League',
                        style: SharedFonts.whiteFont,
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: SharedColors.UnSelectedIconColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Awards',
                        style: SharedFonts.whiteFont,
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
              TextButton(
                style: TextButton.styleFrom(minimumSize: Size(100, 80)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_circle_right_outlined,
                        color: SharedColors.UnSelectedIconColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rules',
                        style: SharedFonts.whiteFont,
                      ),
                    ],
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
