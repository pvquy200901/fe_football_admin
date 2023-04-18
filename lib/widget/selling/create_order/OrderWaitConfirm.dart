import 'package:fe_football_admin/widget/dialog/dialog_confirm_ban.dart';
import 'package:fe_football_admin/widget/dialog/dialog_confirm_finish_match.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_violators.dart';
import 'package:fe_football_admin/widget/dialog/dialog_detail_warning.dart';
import 'package:fe_football_admin/widget/stadium/order/details_myOrder.dart';
import 'package:flutter/material.dart';

import '../../../models/Order_model/listOrder.dart';
import '../../dialog/dialog_confirm_order_wait.dart';
import '../../dialog/dialog_reject_order_wait.dart';

class OrderWaitConfirm extends StatelessWidget {
  final listOrder models;
  const OrderWaitConfirm({super.key, required this.models});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 220,
                child: Row(
                  children: [
                    Text(
                      models.date!,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.normal),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    // Text(
                    //   models.time!,
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 18,
                    //       fontStyle: FontStyle.normal),
                    // ),
                  ],
                )),
            Container(
              width: 50,
              child: Text(
                models.time!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            // Text(
            //   "- ",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 18,
            //       fontStyle: FontStyle.normal),
            // ),
            // Container(
            //   width: 70,
            //   child: Text(
            //     "21:30",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontStyle: FontStyle.normal),
            //   ),
            // ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 200,
              child: Text(
                models.nameStadium!,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            // Container(
            //   width: 120,
            //   child: Text(
            //     "0335959666",
            //     style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontStyle: FontStyle.normal),
            //   ),
            // ),
            // SizedBox(
            //   width: 15,
            // ),
            Container(
              width: 150,
              child: Text(
                "Đợi duyệt",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            // MaterialButton(
            //   color: Colors.white,
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         barrierDismissible: true,
            //         builder: (BuildContext cxt) {
            //           return new DetailMyOrderView();
            //         });
            //   },
            //   child: Text(
            //     "Chi tiết",
            //     style: TextStyle(
            //         color: Colors.red,
            //         fontSize: 14.0,
            //         fontWeight: FontWeight.bold,
            //         fontFamily: 'Merriweather'),
            //   ),
            // ),
            SizedBox(
              width: 5,
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogConfirmOrderWait(code: models.code!,);
                    });
              },
              child: Text(
                "Xác nhận",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            MaterialButton(
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogRejectOrderWait(code: models.code!,);
                    });
              },
              child: Text(
                "Từ chối",
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
