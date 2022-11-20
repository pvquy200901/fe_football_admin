import 'package:flutter/material.dart';

class DialogResetPassCus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Đặt lại mật khẩu:' + '"Mainchester United"'),
      content: const Text('Mật khẩu mặc định: 123456'),
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
