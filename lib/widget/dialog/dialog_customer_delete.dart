import 'package:flutter/material.dart';

class DialogCustomerDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xóa người dùng?'),
      content: const Text('Bạn chắc chắn muốn xóa người này?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Giữ'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Xóa'),
        ),
      ],
    );
  }
}
