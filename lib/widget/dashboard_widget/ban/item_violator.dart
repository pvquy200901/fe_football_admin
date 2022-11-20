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
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            Container(
              child: Text(
                "0335959666",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new MyTeamView();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new MyTeamView();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new MyTeamView();
                }));
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
