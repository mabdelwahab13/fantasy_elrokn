import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:flutter/material.dart';
class DisabledButtonWidget extends StatefulWidget {
  const DisabledButtonWidget({super.key});

  @override
  State<DisabledButtonWidget> createState() => _DisabledButtonWidgetState();
}

class _DisabledButtonWidgetState extends State<DisabledButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        backgroundColor: SharedColors.backgroundGreyColor,
        minimumSize: const Size(200, 50),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child:
          const Text('Login', style: TextStyle(color: Colors.white, fontSize: 20.0)),
    );
  }
}
