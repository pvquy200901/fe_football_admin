import 'package:flutter/material.dart';

import '../../../api/api.dart';
import 'SellItemList.dart';

class Sell_ListStadium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: api.getListOrderToday(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        return  Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < snapshot.data!.length; i++)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          child: Text(
                            ((i + 1).toString() + "- "),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Sell_ItemListStadium(model: snapshot.data![i]),
                      ],
                    ),
                  ]),
                ],
              ),
            Container(
              height: 1,
              width: 250,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  
      }
      else{return CircularProgressIndicator();}
    },);
  }
}
