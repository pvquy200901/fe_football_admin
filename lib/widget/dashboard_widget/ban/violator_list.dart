import 'package:flutter/material.dart';

import 'item_violator.dart';

class ViolatorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Danh sách vi phạm tiêu chuẩn",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merriweather'),
            ),
            Container(
              height: 2,
              width: 150,
              color: Colors.white,
            ),
            for (int i = 0; i < 10; i++) ItemViolator(),
          ],
        ),
      ),
    );
  }
}
