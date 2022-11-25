import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/material.dart';

import '../../../api/api.dart';
import 'item_list_user.dart';

class ItemLandingTeams extends StatelessWidget {
  final String team;
  const ItemLandingTeams({super.key, required this.team});
  List<Widget> pageChildren(double width) {
    return <Widget>[
      FutureBuilder(
        future: api.getListUserInTeam(team),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Wrap(direction: Axis.horizontal, alignment: WrapAlignment.center,
              // gap between lines
              children: <Widget>[
                for (int i = 0; i < snapshot.data!.length; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemListUserTeams(model: snapshot.data![i],),
                    ],
                  ),
              ]),
        ],
      );
        }
        else{return CircularProgressIndicator();}
      },)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width),
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
