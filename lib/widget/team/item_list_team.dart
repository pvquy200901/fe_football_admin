import 'package:fe_football_admin/widget/dialog/dialog_team_delete.dart';
import 'package:fe_football_admin/widget/team/detail_team/MyTeamInfo.dart';
import 'package:flutter/material.dart';

class ItemListTeam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              child: Text(
                "Manchester United",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 150,
              child: Text(
                "0335656666",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 250,
              child: Text(
                "qdnmnnnnn@gmail.com",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 150,
              child: Text(
                "20/11/2022",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            MaterialButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0))),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogTeamDelete();
                    });

                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return new DetailMyOrderView();
                // }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Text(
                  "Xóa ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new MyTeamView();
                }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Text(
                  "Chi tiết",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
