import 'package:fe_football_admin/widget/dashboard_widget/report/item_report.dart';
import 'package:fe_football_admin/widget/dashboard_widget/top_team/item_top_team.dart';
import 'package:flutter/material.dart';

import '../../stadium/create_stadium/item_create_stadium.dart';

class ListReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < 10; i++) ItemReport(),
          ],
        ),
      ),
    );
  }
}
