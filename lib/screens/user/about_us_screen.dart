import 'package:fantasy_elrokn/screens/user/division_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_one_screen.dart';
import 'package:fantasy_elrokn/screens/user/group_two_screen.dart';
import 'package:fantasy_elrokn/screens/user/playoff_screen.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_images.dart';
import 'package:fantasy_elrokn/shared/shared_widget/drawer_widget.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: SharedColors.babyBlueColor),
        backgroundColor: SharedColors.backgroundGreyColor,
        title: Text(
          'About Us',
          style: SharedFonts.babyBlueFont,
        ),
      ),
      drawer: DrawerWidget(
        divisionOne: DivisionOneScreen(),
        groupOne: GroupOneScreen(),
        groupTwo: GroupTwoScreen(),
        playOff: PlayOffScreen(),
        isUser: true,
      ),
      body: GrediantBackgroundWidget(
        child: Container(
          padding: EdgeInsets.fromLTRB(1.w, 1.h, 1.w, 1.h),
          child: Image.asset(
            SharedImages.aboutUs,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
