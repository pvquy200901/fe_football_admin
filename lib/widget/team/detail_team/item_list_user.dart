import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/User_model/User.dart';

class ItemListUserTeams extends StatelessWidget {
  final infoUser model;
  const ItemListUserTeams({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    String chucVu;
    if (model.chucVu == true) {
      chucVu = "Đội trưởng";
    } else {
      chucVu = "Thành viên";
    }
    String img;
    if (model.avatar == "") {
      img = 'assets/LOGO_QDN.png';
    } else {
      img = 'http://localhost:50000/api/File/image/${model.avatar}';
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Container(
        width: 260,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 33, 12, 48),
                Colors.white12,
              ]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                      ),
                    
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15),
                          ),
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(90), // Image radius
                            child: Image.network(
                                img,
                                fit: BoxFit.cover),
                          ),
                        ),
                     
                      //==================
                      Visibility(
                          visible: false,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  width: 40,
                                ),
                              ])),
                      //===================
                      // Visibility(
                      //     visible: true,
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: <Widget>[
                      //           IconButton(
                      //             icon: const Icon(Icons.close),
                      //             onPressed: () {
                      //               showDialog(
                      //                   context: context,
                      //                   barrierDismissible: true,
                      //                   builder: (BuildContext cxt) {
                      //                     return new DialogRemoveUser();
                      //                   });
                      //             },
                      //           ),
                      //         ])),
                      //===============
                    ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        model.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 26.0,
                            color: Colors.white),
                      ),
                      Text(
                        model.phone!,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10.0,
                            color: Colors.white),
                      ),
                      Container(
                        width: 250,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                chucVu,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.0,
                                    color: Colors.white),
                              ),
                            ]),
                      ),
                      // MaterialButton(
                      //   color: Colors.white,
                      //   shape: RoundedRectangleBorder(
                      //       borderRadius:
                      //           BorderRadius.all(Radius.circular(16.0))),
                      //   onPressed: () {},
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(
                      //         vertical: 2.0, horizontal: 16.0),
                      //     child: Text(
                      //       "Xem thông tin",
                      //       style: TextStyle(color: Colors.red),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
