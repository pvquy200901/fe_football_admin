import 'package:flutter/material.dart';

import '../../api/api.dart';

class DialogConfirmWarning extends StatelessWidget {
  final String email;
  final String name;
  const DialogConfirmWarning({super.key, required this.email, required this.name});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:  Text("Người dùng: ${name}"),
      content: const Text('Người này đã vi phạm về hình ảnh không phù hợp'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
            api.sendEmail(email);
            Navigator.pop(context, 'OK');
          },
          child: const Text('Cảnh cáo'),
        ),
      ],
    );
  }
}
