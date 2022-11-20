import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/material.dart';

import 'item_list_user.dart';

class ItemLandingTeams extends StatelessWidget {
  List<Widget> pageChildren(double width) {
    return <Widget>[
      ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Wrap(direction: Axis.horizontal, alignment: WrapAlignment.center,
              // gap between lines
              children: <Widget>[
                for (int i = 0; i < 15; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemListUserTeams(),
                    ],
                  ),
              ]),
        ],
      ),
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
