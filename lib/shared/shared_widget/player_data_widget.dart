import 'package:fantasy_elrokn/shared/shared_theme/shared_colors.dart';
import 'package:fantasy_elrokn/shared/shared_theme/shared_fonts.dart';
import 'package:fantasy_elrokn/shared/shared_widget/awards_widget.dart';
import 'package:flutter/material.dart';

class PlayerDataWidget extends StatefulWidget {
  const PlayerDataWidget({super.key});

  @override
  State<PlayerDataWidget> createState() => _PlayerDataWidgetState();
}

class _PlayerDataWidgetState extends State<PlayerDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 10.0,
            bottom: 20,
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
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mohammed Abdelwahab',
                          style: SharedFonts.subWhiteFont,
                        ),
                        Text(
                          'ChampionsOfLeague2',
                          style: SharedFonts.subWhiteFont,
                        ),
                      ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: Text(
                      '-4',
                      style: SharedFonts.subWhiteFont,
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    '66',
                    style: SharedFonts.subWhiteFont,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Text(
                    '2053',
                    style: SharedFonts.subWhiteFont,
                  ),
                ),
              ),
            ],
          ),
        ),
        AwardsData(title: 'player Of Week', num: 2),
        AwardsData(title: 'Player Of Month', num: 2),
      ],
    );
  }
}

class PlayerDataTopRow extends StatelessWidget {
  const PlayerDataTopRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 10.0,
        bottom: 20,
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
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                'PlayerN ',
                style: SharedFonts.whiteFont,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                'Min',
                style: SharedFonts.whiteFont,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                'GW',
                style: SharedFonts.whiteFont,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Text(
                'Total',
                style: SharedFonts.whiteFont,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
