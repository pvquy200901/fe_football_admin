import 'package:fe_football_admin/widget/navigation/admin_avata_user.dart';
import 'package:flutter/material.dart';

class ManagerCenterNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Trang chủ",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.people, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Khách hàng",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.stadium, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Sân",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),

                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.group, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Đội",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.newspaper, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Tin tức",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 28.0,
                      height: 28.0,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(Icons.phone, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return new HomeView();
                        // }));
                      },
                      child: Text(
                        "Liên hệ",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 80,
                ),

                //AccountHeader(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
