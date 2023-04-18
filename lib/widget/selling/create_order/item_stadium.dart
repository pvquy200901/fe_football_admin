import 'dart:math';

import 'package:flutter/material.dart';

import '../../../models/Stadium_model/Stadium.dart';
import 'order_create.dart';

class ItemStadium extends StatelessWidget {
  final listStadium model;
  const ItemStadium({super.key, required this.model});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Container(
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
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15),
                  ),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(90), // Image radius
                    child:
                        Image.network('http://localhost:50000/api/File/image/${model.images![0]}', fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "7:00 - 22:30",
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                      Text(
                        model.name!,
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 26.0,
                            color: Colors.white),
                      ),
                      Container(
                        width: 250,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      model.address!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                          overflow: TextOverflow.clip,
                                          color: Colors.black),
                                    ),
                                  ]),
                            ]),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () {
                    Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return new OrderCreateView(name: model.name!, address: model.address!, price: model.price!,);
                            }));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 16.0),
                    child: Text(
                      "Chọn",
                      style: TextStyle(color: Colors.red),
                    ),
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
