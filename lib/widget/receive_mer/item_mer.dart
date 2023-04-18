import 'package:fe_football_admin/screens/stadium/Stadium_Edit.dart';
import 'package:fe_football_admin/widget/dialog/dialog_stadium_delete.dart';
import 'package:flutter/material.dart';

class ItemMerchandise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 75,
              child: Text(
                "Number 1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 20,
              child: Text(
                "55",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 100,
              child: Text(
                "15.000d/chai",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
