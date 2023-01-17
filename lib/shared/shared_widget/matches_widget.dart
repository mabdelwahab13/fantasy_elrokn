import 'package:flutter/material.dart';

import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';

class MatchesScreenWidget extends StatefulWidget {
  String division;
  int? numOfMatches;
  MatchesScreenWidget({
    Key? key,
    required this.division,
    required this.numOfMatches,
  }) : super(key: key);

  @override
  State<MatchesScreenWidget> createState() => _MatchesScreenWidgetState();
}

class _MatchesScreenWidgetState extends State<MatchesScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.4,
        decoration: BoxDecoration(
          border: Border.all(
            color: SharedColors.yellowColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15),
          color: SharedColors.backgroundGreyColor,
        ),
        padding: const EdgeInsets.all(15),
        child: ListTile(
          title: Text(
            '${widget.division}\n',
            style: SharedFonts.whiteFont,
          ),
          subtitle: ListView.builder(
            //physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.numOfMatches,
            itemBuilder: (context, index) {
              return const MatchesWidget();
            },
          ),
        ),
      ),
    );
  }
}

class MatchesWidget extends StatelessWidget {
  const MatchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Team1', style: SharedFonts.subWhiteFont),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            child: Text(
              '300',
              style: SharedFonts.subWhiteFont,
            ),
          ),
          const Text(
            ':',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey,
            ),
            child: Text(
              '300',
              style: SharedFonts.subWhiteFont,
            ),
          ),
          Text(
            'Team2',
            style: SharedFonts.subWhiteFont,
          ),
        ],
      ),
    );
  }
}
