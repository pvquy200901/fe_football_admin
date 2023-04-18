import 'package:fe_football_admin/widget/navigation/admin_avata_user.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';

class TotalValueTopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color.fromARGB(255, 60, 134, 245),
                  Colors.black,
                  Colors.black,
                ]),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Tổng số đơn đặt sân trong tháng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: api.totalOrderInMonth(),
                builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(
                snapshot.data!.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              );
                }
                else{return CircularProgressIndicator();}
              },)
            ],
          ),
        ),
        SizedBox(
          width: 80,
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color.fromARGB(255, 60, 134, 245),
                  Colors.black,
                  Colors.black,
                ]),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Tin đợi duyệt",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: api.getListConfirmNews(),
                builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(
                snapshot.data!.length.toString(),
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              );
                }
                else{return CircularProgressIndicator();}
              },)
            ],
          ),
        ),
        SizedBox(
          width: 80,
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color.fromARGB(255, 60, 134, 245),
                  Colors.black,
                  Colors.black,
                ]),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Thành viên mới",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: api.getListUser(),
                    builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return Text(
                    snapshot.data!.length.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather'),
                  );
                    }
                    else{return CircularProgressIndicator();}
                  },),
                  Icon(
                    Icons.arrow_upward,
                    color: Colors.green,
                    size: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
        ),
        Container(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: [
                  // Color.fromARGB(255, 60, 134, 245),
                  Colors.black,
                  Colors.black,
                ]),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Tổng số đội",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: api.getListTeam(),
                builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Text(
                snapshot.data!.length.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              );
                }
                else{return CircularProgressIndicator();}
              },)
            ],
          ),
        ),
      ]),
    );
  }
}
