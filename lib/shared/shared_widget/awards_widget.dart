// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
      height: 9.h,
      width: 95.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: SharedColors.backgroundGreyColor,
        border: Border.all(
          color: SharedColors.babyBlueColor,
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

