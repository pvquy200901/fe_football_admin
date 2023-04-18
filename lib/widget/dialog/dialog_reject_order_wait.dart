import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogRejectOrderWait extends StatelessWidget {
  final String code;
  const DialogRejectOrderWait({super.key, required this.code});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Từ chối đơn đặt'),
      content: const Text('Đơn đặt chưa thanh toán'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
          api.cancelOrder(code).then((value) {
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
