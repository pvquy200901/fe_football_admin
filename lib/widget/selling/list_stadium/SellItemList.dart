import 'package:fe_football_admin/widget/dialog/dialog_confirm_ban.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_violators.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_warning.dart';
import 'package:fe_football_admin/widget/stadium/order/details_myOrder.dart';
import 'package:flutter/material.dart';

import '../../../models/Order_model/listOrder.dart';
import '../../dialog/dialog_confirm_finish_match.dart';

class Sell_ItemListStadium extends StatelessWidget {
  final listOrder model;
  const Sell_ItemListStadium({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: Text(
                model.nameStadium!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 100,
              child: Text(
                model.time!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DetailMyOrderView();
                    });
              },
              child: Text(
                "Chi tiết",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogConfirmFinishMatch();
                    });
              },
              child: Text(
                "Kết thúc",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
