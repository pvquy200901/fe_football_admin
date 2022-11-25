import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogStadiumDelete extends StatelessWidget {
  final String name;
  const DialogStadiumDelete({super.key, required this.name});
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
          onPressed: () {
            api.deleteStadium(name).then((value){
              if (value){
                 Future.delayed(const Duration(seconds: 0)).then((value) async {
                  Get.offAllNamed('/listStadium');
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
