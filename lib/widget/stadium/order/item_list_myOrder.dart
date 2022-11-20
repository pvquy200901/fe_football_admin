import 'package:flutter/material.dart';

import 'details_myOrder.dart';

class ItemListMyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150,
            ),
            Text(
              "06/11/2022",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              width: 170,
            ),
            Text(
              "15:00",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              width: 165,
            ),
            Text(
              "Stadium 1",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              width: 150,
            ),
            MaterialButton(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0))),
              onPressed: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext cxt) {
                      return new DetailMyOrderView();
                    });

                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return new DetailMyOrderView();
                // }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
                child: Text(
                  "Xem ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
