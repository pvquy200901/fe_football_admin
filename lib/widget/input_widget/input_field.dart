import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final String content;
  //bool hide;
  final bool isHidden;

  InputField(
      {required this.label, required this.content, required this.isHidden});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 110.0,
              child: Text(
                "$label",
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 4.0,
              color: Colors.blue[50],
              child: TextField(
                // enabled: hide,
                obscureText: isHidden,
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.all(10.0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 60, 134, 245),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 60, 134, 245),
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintText: "$content",
                  fillColor: Colors.blue[50],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
