import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy_elrokn/controllers/main_model.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/grediant_backgound_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ProfilesScreen extends StatefulWidget {
  const ProfilesScreen({super.key});

  @override
  State<ProfilesScreen> createState() => _ProfilesScreenState();
}

class _ProfilesScreenState extends State<ProfilesScreen> {
  List usersEmails = [];
  // var user;
  // Future<void> getUserData()async{
  //   var userData = await    FirebaseFirestore.instance.collection("user").get().then((snapshot) {
  //     snapshot.userData.forEach((element) {
  //       usersEmails.add(element.documentID);
  //     });
  // });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: SharedColors.backgroundSubGreyColor,
            title: Text(
              'Profiles',
              style: SharedFonts.yellowFont,
            ),
          ),
          body: GrediantBackgroundWidget(
            child: ListView.builder(
              itemCount: usersEmails.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${usersEmails[index]}',
                        style: SharedFonts.whiteFont,
                      ),
                      IconButton(
                        onPressed: () {
                          showMenu(
                              color: SharedColors.backgroundBlackColor,
                              context: context,
                              position: const RelativeRect.fromLTRB(
                                  60.0, 40.0, 40.0, 40.0),
                              items: [
                                PopupMenuItem(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Make Admin',
                                      style: SharedFonts.subYellowFont,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Remove Admin',
                                      style: SharedFonts.subYellowFont,
                                    ),
                                  ),
                                ),
                              ]);
                        },
                        icon: Icon(
                          Icons.mode_rounded,
                          color: SharedColors.yellowColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
