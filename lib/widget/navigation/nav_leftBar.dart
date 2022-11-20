import 'package:fe_football_admin/screens/customer/Customer.dart';
import 'package:fe_football_admin/screens/dashboard/Dashboard.dart';
import 'package:fe_football_admin/screens/news/News.dart';
import 'package:fe_football_admin/screens/stadium/Stadium.dart';
import 'package:fe_football_admin/screens/team/Team.dart';
import 'package:fe_football_admin/widget/navigation/admin_avata_user.dart';
import 'package:flutter/material.dart';

class LeftNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width / 10,
        height: MediaQuery.of(context).size.height,
        //==================
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color.fromARGB(255, 60, 134, 245),
                Color.fromARGB(255, 6, 22, 29),
                Color.fromARGB(255, 6, 22, 29),
              ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
        ),
        //==============
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            AdminLeftBar(),
            SizedBox(
              height: 55,
            ),
            Column(
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
                        child: Icon(Icons.pending_actions, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new DashboardView();
                        }));
                      },
                      child: Text(
                        "Bán hàng",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
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
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new DashboardView();
                        }));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new CustomerView();
                        }));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new StadiumView();
                        }));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new TeamView();
                        }));
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
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new NewsView();
                        }));
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
