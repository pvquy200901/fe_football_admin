import 'package:fe_football_admin/screens/stadium/Stadium_Edit.dart';
import 'package:fe_football_admin/widget/dialog/dialog_stadium_delete.dart';
import 'package:flutter/material.dart';

class ItemListStadium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              child: Text(
                "Stadium 1",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 450,
              child: Text(
                "475A Điện Biên Phủ, Bình Thạnh",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 110,
              child: Text(
                "0337979799",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 100,
              child: Text(
                "20/11/2022",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 70,
              child: Image.asset(
                'images/ex_user.png',
                height: 50,
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
                      return new DialogStadiumDelete();
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
            MaterialButton(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(26.0))),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new StadiumEditView();
                }));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
                child: Text(
                  "Sửa",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
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
