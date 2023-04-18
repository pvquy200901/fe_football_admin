import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogConfirmOrderWait extends StatelessWidget {
  final String code;
  const DialogConfirmOrderWait({super.key, required this.code});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xác nhận đơn đặt'),
      content: const Text('Đơn đặt đã thanh toán'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
            api.confirmOrder(code).then((value) {
              if (value) {
                Future.delayed(const Duration(seconds: 0)).then((value) async {
                  Get.offAllNamed('/listConfirmOrder');
                });
              }
            });
            Navigator.pop(context, 'OK');
          },
          child: const Text('Xác nhận'),
        ),
      ],
    );
  }
}
