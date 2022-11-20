import 'package:flutter/material.dart';

import 'item_landing_team.dart';
import 'item_list_match_history.dart';

class LandingUserTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Thành viên Đội của bạn",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ItemLandingTeams(),
              ],
            ),
            Container(
              color: Colors.black,
              height: 3.5,
              width: 1250,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Lịch sử thi đấu",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      for (int i = 0; i < 5; i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text((i + 1).toString() + "-"),
                            const SizedBox(
                              width: 150,
                            ),
                            ItemMatchHistoryTeam(),
                          ],
                        ),
                    ],
                  ),
                ]),
            Container(
              color: Colors.black,
              height: 3.5,
              width: 1250,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Hình ảnh của team",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
            Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  for (int i = 0; i < 15; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15),
                      ),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(120), // Image radius
                        child: Image.network('assets/LOGO_QDN.png',
                            fit: BoxFit.cover),
                      ),
                    ),
                ]),
          ],
        ),
      ),
    );
  }
}
