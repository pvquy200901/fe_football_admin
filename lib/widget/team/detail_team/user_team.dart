import 'package:flutter/material.dart';

import '../../../api/api.dart';
import 'item_landing_team.dart';
import 'item_list_match_history.dart';

class LandingUserTeam extends StatelessWidget {
  final String team;
  const LandingUserTeam({super.key, required this.team});
  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
    future: api.getInfoTeamForAdmin(team),
    builder: (context, snapshot) {
     if(snapshot.hasData){
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
                      "Thành viên Đội",
                      style: TextStyle(color: Colors.black, fontSize: 28),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ItemLandingTeams(team: snapshot.data!.name!,),
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
                  for (int i = 0; i < snapshot.data!.imageTeam!.length; i++)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15),
                      ),
                      child: SizedBox.fromSize(
                        size: Size.fromRadius(120), // Image radius
                        child: Image.network('http://localhost:50000/api/File/image/${snapshot.data!.imageTeam![i]}',
                            fit: BoxFit.cover),
                      ),
                    ),
                ]),
          ],
        ),
      ),
    );
  
     }
     else{return CircularProgressIndicator();}
   },);
  }
}
