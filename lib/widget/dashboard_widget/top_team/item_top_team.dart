import 'package:fe_football_admin/screens/stadium/Stadium_Edit.dart';
import 'package:flutter/material.dart';

import '../../team/detail_team/MyTeamInfo.dart';
import '../../team/detail_team/user_team.dart';

class ItemTopTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.lightBlue,
              radius: 25,
              child: CircleAvatar(
                backgroundColor: Colors.lightBlue[100],
                radius: 20,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage("assets/LOGO_QDN.png"), //NetworkImage
                  radius: 15,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(
                "Manchester United",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            // MaterialButton(
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return new MyTeamView();
            //     }));
            //   },
            //   child: Icon(
            //     Icons.remove_red_eye,
            //     color: Colors.white,
            //     size: 14.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
