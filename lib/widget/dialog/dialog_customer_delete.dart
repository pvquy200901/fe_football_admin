import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogCustomerDelete extends StatelessWidget {
  final String username;
  const DialogCustomerDelete({super.key, required this.username});
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
          onPressed: () {
            api.deleteUser(username).then((value){
              if (value){
                 Future.delayed(const Duration(seconds: 0)).then((value) async {
                  Get.offAllNamed('/listUser');
                });
              }
            });
          Navigator.pop(context, 'OK');
          }, 
          child: const Text('Xóa'),
        ),
      ],
    );
  }
}
