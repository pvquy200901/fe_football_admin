import 'package:flutter/material.dart';

import '../../widget/stadium/create_stadium/item_create_stadium.dart';

class StadiumCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey,
                Colors.blueGrey,
              ]),
        ),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ItemCreateStadium(),
            ],
          ),
        ),
      ),
    );
  }
}
