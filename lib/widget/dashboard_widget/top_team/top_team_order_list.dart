import 'package:fe_football_admin/widget/dashboard_widget/top_team/item_top_team.dart';
import 'package:flutter/material.dart';

import '../../stadium/create_stadium/item_create_stadium.dart';

class TopteamItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Top 10 đội thi đấu nhiều",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather'),
            ),
            Container(
              height: 1,
              width: 150,
              color: Colors.white,
            ),
            for (int i = 0; i < 10; i++) ItemTopTeam(),
          ],
        ),
      ),
    );
  }
}
