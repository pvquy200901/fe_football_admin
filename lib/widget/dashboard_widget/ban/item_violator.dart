import 'package:fe_football_admin/widget/dialog/dialog_confirm_ban.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_violators.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_warning.dart';
import 'package:flutter/material.dart';

import '../../team/detail_team/MyTeamInfo.dart';

class ItemViolator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "Manchester United",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              child: Text(
                "0335959666",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogDetailViolators();
                    });
              },
              child: Text(
                "Chi tiết",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogConfirmBan();
                    });
              },
              child: Text(
                "Cấm",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogConfirmWarning();
                    });
              },
              child: Text(
                "Cảnh cáo",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
