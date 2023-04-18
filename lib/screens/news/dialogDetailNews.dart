import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../api/api.dart';

class DetailNewsDialog extends StatefulWidget {
  final String name;
  final String title;
  final String time;

  DetailNewsDialog(
      {required this.name,
        required this.title,
        required this.time,
        });

  @override
  _DetailNewsDialogState createState() => _DetailNewsDialogState();
}

class _DetailNewsDialogState extends State<DetailNewsDialog> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //contentPadding: EdgeInsets.all(50),
      title: Text("Xem chi tiết"),
      content: Column(
        children: [

        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Hủy bỏ'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Lưu'),
        ),
      ],
    );
  }
}
