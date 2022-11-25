import 'package:fe_football_admin/widget/team/detail_team/user_team.dart';
import 'package:flutter/material.dart';

class MyTeamView extends StatelessWidget {
  final String team;
  const MyTeamView({super.key, required this.team});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey,
                Colors.lightBlueAccent,
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Visibility(
                visible: true,
                child: LandingUserTeam(team: team,),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Xong"),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
