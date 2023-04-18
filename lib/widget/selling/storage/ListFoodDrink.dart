import 'package:fe_football_admin/widget/selling/storage/item_food_drink.dart';
import 'package:flutter/material.dart';

class ListFoodDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < 15; i++)
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
                        ItemFoodDrink(),
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
}
