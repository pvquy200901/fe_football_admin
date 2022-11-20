import 'package:fe_football_admin/widget/input_widget/input_password.dart';
import 'package:flutter/material.dart';

import '../widget/input_widget/input_field.dart';
import 'dashboard/Dashboard.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          color: Color.fromARGB(255, 37, 72, 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.only(
                  //     top: 140.0, right: 70.0, left: 70.0, bottom: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 21.0),

                      //InputField Widget from the widgets folder
                      InputField(
                          label: "Tên đăng nhập", content: "", isHidden: false),

                      SizedBox(height: 20.0),

                      InputField(
                          label: "Mật khẩu",
                          content: "********",
                          isHidden: true),

                      SizedBox(height: 20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 60, 134, 245),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return new DashboardView();
                              }));
                            },
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
