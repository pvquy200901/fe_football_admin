import 'package:flutter/material.dart';

class DialogStadiumDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xóa sân này?'),
      content: const Text('Bạn chắc chắn muốn xóa sân này?'),
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
