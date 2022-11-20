import 'package:flutter/material.dart';

class DialogNewsDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xóa bài viết này?'),
      content: const Text('Bạn chắc chắn muốn xóa bài viết này?'),
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
