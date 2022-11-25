import 'package:fe_football_admin/widget/dialog/dialog_customer_delete.dart';
import 'package:fe_football_admin/widget/dialog/dialog_reset_pass_cus.dart';
import 'package:flutter/material.dart';

import '../../models/User_model/User.dart';

class ItemListMyCustomer extends StatelessWidget {
  final listUser model;
  const ItemListMyCustomer({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 250,
              child: Text(
               model.name!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 150,
              child: Text(
                model.phone!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 250,
              child: Text(
                model.email!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Container(
              width: 150,
              child: Text(
                model.birthday!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            MaterialButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0))),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DialogCustomerDelete(username: model.username!,);
                    });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Text(
                  "Xóa ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            // MaterialButton(
            //   color: Colors.blue,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(Radius.circular(26.0))),
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         barrierDismissible: true,
            //         builder: (BuildContext cxt) {
            //           return new DialogResetPassCus();
            //         });
            //   },
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            //     child: Text(
            //       "Đặt lại ",
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 16,
            //           fontStyle: FontStyle.normal),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
