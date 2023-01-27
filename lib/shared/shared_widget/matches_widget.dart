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
  EdgeInsets padding = EdgeInsets.only(top: 15, bottom: 15);
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
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.division,
              style: SharedFonts.whiteFont,
            ),
            SizedBox(height: 20,),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(3.5),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(0.3),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(3.5),
              },
              border: TableBorder(
                horizontalInside: BorderSide(
                color: SharedColors.yellowColor,
                  width: 2,
                ),
              ),
              children: [
                for(int i =0; i<10; i++)
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                       alignment: Alignment.center,
                       padding: padding,
                        child: Text(
                          'The Gabblers',
                          style: SharedFonts.whiteMatchesFont,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                        alignment: Alignment.center,
                        color: SharedColors.greenTable,
                        child: Text(
                          '300',
                          style: SharedFonts.whiteFont,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                       alignment: Alignment.center,
                        child: Text(
                          ':',
                          style: SharedFonts.whiteFont,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                       alignment: Alignment.center,
                        color: SharedColors.redTable,
                        child: Text(
                          '300',
                          style: SharedFonts.whiteFont,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Container(
                       alignment: Alignment.center,
                       padding: padding,
                        child: Text(
                          'Xhakalaka Boom',
                          style: SharedFonts.whiteMatchesFont,
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}

 
// class MatchesWidget extends StatelessWidget {
//   const MatchesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(bottom: 10),
//       alignment: Alignment.center,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text('Team1', style: SharedFonts.subWhiteFont),
//           Container(
//             alignment: Alignment.center,
//             height: 40,
//             width: 50,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15), color: Colors.grey),
//             child: Text(
//               '300',
//               style: SharedFonts.subWhiteFont,
//             ),
//           ),
//           const Text(
//             ':',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             height: 40,
//             width: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.grey,
//             ),
//             child: Text(
//               '300',
//               style: SharedFonts.subWhiteFont,
//             ),
//           ),
//           Text(
//             'Team2',
//             style: SharedFonts.subWhiteFont,
//           ),
//         ],
//       ),
//     );
//   }
// }
