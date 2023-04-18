import 'package:fe_football_admin/widget/navigation/admin_avata_user.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';

class InfoSellday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FutureBuilder(
            future: api.getListOrderToday(),
            builder: (context, snapshot) {
            if(snapshot.hasData){
              return Container(
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
                "Tổng số trận trong ngày",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                snapshot.data!.length.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ],
          ),
        );
            }
            else{ return CircularProgressIndicator();}
          },),
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
                "Trận đã xong",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "5",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80,
        ),
        FutureBuilder(
          future: api.totalPriceToday(),
          builder: (context, snapshot) {
          if(snapshot.hasData){
            return Container(
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
                "Doanh thu ngày",
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
                  Text(
                    snapshot.data!.toVND(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather'),
                  ),
                ],
              ),
            ],
          ),
        );
          }
          else{ return CircularProgressIndicator();}

        },),
        SizedBox(
          width: 80,
        ),
       FutureBuilder(
        future: api.totalPriceMonth(),
        builder: (context, snapshot) {
         if(snapshot.hasData){
          return  Container(
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
                "Tổng thu/ tháng",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontFamily: 'Merriweather'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                snapshot.data!.toVND(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merriweather'),
              ),
            ],
          ),
        );
         }
         else{return CircularProgressIndicator();}
       },)
      ]),
    );
  }
}
