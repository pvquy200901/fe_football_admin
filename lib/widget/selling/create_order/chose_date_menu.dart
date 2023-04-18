import 'package:flutter/material.dart';

class ChoseDateMenu extends StatefulWidget {
  // immutable Widget
  @override
  _ChoseDateMenu createState() => _ChoseDateMenu();
  // creating State Object of MyWidget
}

class _ChoseDateMenu extends State<ChoseDateMenu> {
  String day = DateTime.now().day.toString();
  String mon = DateTime.now().month.toString();
  int lastday = DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;
  bool click = true;
  Color mau = Color.fromARGB(255, 112, 145, 201);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mau,
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day)) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day)) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day)).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day)) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon)).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            day = (lastday).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 1) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 1) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 1) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 1).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 2) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 2) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 2).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 2) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 1).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 2).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 3) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 3) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 3).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 3) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 1).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 3).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 4) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 4) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 4).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 4) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 4).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 4).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 5) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 5) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 5).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 5) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 5).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 5).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
        SizedBox(
          width: 50,
        ),
        Visibility(
          visible: true,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 145, 201),
                  side: BorderSide(width: 1, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                if ((int.parse(day) + 6) > lastday) day = "1";
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if ((int.parse(day) + 6) <= lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            mon + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 6).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                  if ((int.parse(day) + 6) > lastday)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (int.parse(mon) + 1).toString() + "\n",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Text(
                            (int.parse(day) + 1).toString(),
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ]),
                ],
              )),
        ),
      ]),
    );
  }
}
