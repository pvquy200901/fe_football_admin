import 'package:flutter/material.dart';

class DialogConfirmBan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Dừng hoạt động tài khoản:' + '"Mainchester United"'),
      content: const Text('Người dùng vi phạm điều khoản.'),
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
