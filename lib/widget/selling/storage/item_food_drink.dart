import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';

class ItemFoodDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 75,
              child: Text(
                "Number 1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 20,
              child: Text(
                "55",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 100,
              child: Text(
                "15.000d/chai",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            CustomizableCounter(
              borderColor: Colors.yellow,
              borderRadius: 100,
              backgroundColor: Colors.amberAccent,
              buttonText: "Thêm",
              textColor: Colors.white,
              textSize: 14,
              count: 0,
              step: 1,
              minCount: 0,
              incrementIcon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              decrementIcon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
              onCountChange: (count) {},
              onIncrement: (count) {},
              onDecrement: (count) {},
            ),
            MaterialButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                // showDialog(
                //     context: context,
                //     barrierDismissible: true,
                //     builder: (BuildContext cxt) {
                //       return new DialogStadiumDelete();
                //     });
              },
              child: Text(
                "Mua",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontStyle: FontStyle.normal),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
