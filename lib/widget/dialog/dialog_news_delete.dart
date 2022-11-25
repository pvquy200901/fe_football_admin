import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogNewsDelete extends StatelessWidget {
  final String code;
  const DialogNewsDelete({super.key, required this.code});
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
          onPressed: () {
            api.removeNews(code).then((value){
              if (value){
                 Future.delayed(const Duration(seconds: 0)).then((value) async {
                  Get.offAllNamed('/listNews');
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
