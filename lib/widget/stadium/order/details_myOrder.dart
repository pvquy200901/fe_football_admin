import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailMyOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: Container(
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Chi tiết đặt sân:",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                    //mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        "Ngày đặt sân:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Trạng thái:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Giờ bắt đầu:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Số giờ thuê:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Địa chỉ sân:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Sân số:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Giá sân/h:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tổng tiền:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Hình thức thanh toán:",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                    ]),
                SizedBox(
                  width: 50,
                ),
                Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "06/07/2022",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Đợi xác nhận",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "20:00:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "2:00:00",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //Gắn link dẫn sang ggmap
                      //làm sau
                      Text(
                        "475A Điện Biên Phủ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "250.000 vnd",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "500.000 vnd",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Tiền mặt",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                      Container(
                        color: Colors.black,
                        height: 1,
                        width: 250,
                      ),
                    ]),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 252, 252),
                ),
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: Text(
                  "Xong",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
