import 'package:flutter/material.dart';

class DialogConfirmFinishMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Hoàn tất trận đấu này?'),
      content: const Text(''),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Xác nhận'),
        ),
      ],
    );
  }
}
