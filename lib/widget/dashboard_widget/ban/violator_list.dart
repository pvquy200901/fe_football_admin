import 'package:flutter/material.dart';

import 'item_violator.dart';

class ViolatorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < 150; i++) ItemViolator(),
          ],
        ),
      ),
    );
  }
}
