// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';

class AwardsWidget extends StatefulWidget {
  List winner;
  String award;
  String points;
  int num;
  AwardsWidget({
    Key? key,
    required this.winner,
    required this.award,
    required this.points,
    required this.num,
  }) : super(key: key);

  @override
  State<AwardsWidget> createState() => _AwardsWidgetState();
}

class _AwardsWidgetState extends State<AwardsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: SharedColors.backgroundGreyColor,
        border: Border.all(
          color: SharedColors.yellowColor,
          width: 2,
        ),
      ),
      child: ListTile(
        subtitle: Column(
          children: [
            for(int i=0; i<widget.num;i++)
            Text(
              widget.winner[i],
              style: SharedFonts.subWhiteFont,
            ),
          ],
        ),
        title: Text(
          widget.award,
          style: SharedFonts.subWhiteFont,
        ),
        trailing: Text(
          widget.points,
          style: SharedFonts.subWhiteFont,
        ),
      ),
    );
  }
}

class AwardsData extends StatefulWidget {
  String title;
  int num;
  AwardsData({
    Key? key,
    required this.title,
    required this.num,
  }) : super(key: key);

  @override
  State<AwardsData> createState() => _AwardsDataState();
}

class _AwardsDataState extends State<AwardsData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10.0,
        bottom: 5,
        right: 10,
      ),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: SharedColors.yellowColor,
          width: 2,
        ),
        color: SharedColors.backgroundGreyColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                '${widget.title}',
                style: SharedFonts.subWhiteFont,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 3,
              child: Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                '${widget.num}',
                style: SharedFonts.subWhiteFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
