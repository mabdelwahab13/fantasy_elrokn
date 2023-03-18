// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';

class GrediantBackgroundWidget extends StatelessWidget {
  final Widget? child;
  const GrediantBackgroundWidget({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SharedColors.backgroundColor,
            //   gradient: LinearGradient(
            //   begin: Alignment.center,
            //   end: Alignment.bottomLeft,
            //   colors: [
            //     SharedColors.backgroundBlackColor,
            //     SharedColors.backgroundSubGreyColor
            //   ]
            // ),
            ),
            child: child,
    );
  }
}
