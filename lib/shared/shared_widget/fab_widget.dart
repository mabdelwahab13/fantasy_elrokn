import 'package:flutter/material.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';

class FabWidget extends StatefulWidget {
  final Function onPressed;
  FabWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<FabWidget> createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: SharedColors.babyBlueColor,
        child: Icon(
          Icons.add,
          color: SharedColors.backgroundBlackColor,
        ),
        onPressed: () => widget.onPressed(),
      );
  }
}