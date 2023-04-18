import 'dart:js';
import 'package:fe_football_admin/widget/selling/create_order/item_stadium.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../../api/api.dart';
import '../../../config/style.dart';
import '../../../config/text.dart';
import '../../../screens/dashboard/sidebar.dart';

class LandingStadium extends StatefulWidget {
  const LandingStadium({Key? key}) : super(key: key);

  @override
  _LandingStadiumState createState() => _LandingStadiumState();
}
class _LandingStadiumState extends State<LandingStadium> {
  SideBarWidget _sideBarWidget = SideBarWidget();
  List<Widget> pageChildren(double width) {
    return <Widget>[
      FutureBuilder(
        future: api.getListStadium(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                for (int i = 0; i < snapshot.data!.length; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemStadium(model: snapshot.data![i]),
                    ],
                  ),
              ]),
        ],
      );
        }
        else{return CircularProgressIndicator();}
      },)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Visibility(
                  child: CustomText(
                    text: 'Quản lý hệ thống',
                    color: lightgrey,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                color: dark.withOpacity(.7),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: dark.withOpacity(.7),
                    ),
                  ),
                  Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                          width: 12,
                          height: 12,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: light, width: 2))))
                ],
              ),
              Container(
                width: 1,
                height: 22,
                color: lightgrey,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(
                      Icons.person_outline,
                      color: dark,
                    ),
                  ),
                ),
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: dark,
          ),
          backgroundColor: light,
          // iconTheme: IconThemeData(
          //   color: Colors.white,
          // ),
          // title: Text(
          //   'Gobike dashboard'.toUpperCase(),
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.w900,
          //     fontSize: 19,
          //   ),
          // ),
        ),
        backgroundColor: light,
        sideBar: _sideBarWidget.SideBarMenus(context, '/order'),
        body:  FutureBuilder(
          future: api.getListStadium(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: <Widget>[
                        for (int i = 0; i < snapshot.data!.length; i++)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ItemStadium(model: snapshot.data![i]),
                            ],
                          ),
                      ]),
                ],
              );
            }
            else{return CircularProgressIndicator();}
          },));


  }
}
