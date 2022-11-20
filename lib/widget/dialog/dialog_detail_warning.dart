import 'package:flutter/material.dart';

class DialogConfirmWarning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Người dùng: ' + '"Manchester"'),
      content: const Text('Người này đã vi phạm về hình ảnh không phù hợp'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('Cảnh cáo'),
        ),
      ],
    );
  }
}
