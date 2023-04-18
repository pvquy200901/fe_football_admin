import 'package:flutter/material.dart';

class DialogConfirmBan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Cấm đăng bài..!!!'),
      content: const Text('Người dùng này vi phạm điều khoản nhiều lần.'),
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
