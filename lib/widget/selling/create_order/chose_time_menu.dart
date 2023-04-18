import 'package:flutter/material.dart';

class ChoseTimeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          // gap between lines
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Visibility(
                visible: true,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "7:00 - 8:30",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Visibility(
                visible: true,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "8:30 - 10:00",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              Visibility(
                visible: true,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(width: 1, color: Colors.black),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "10:00 - 11:30",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    )),
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "12:00 - 13:30",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "13:30 - 15:00",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "15:00 - 16:30",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "16:30 - 18:00",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "18:00 - 19:30",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "19:30 - 21:00",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(width: 1, color: Colors.black),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "21:00 - 22:30",
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ],
                      )),
                ),
              ],
            )
          ]),
    );
  }
}
