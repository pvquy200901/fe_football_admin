import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogConfirmOrder extends StatelessWidget {
   final String startTime;
  final String endTime;
  final String name;

  const DialogConfirmOrder({super.key, required this.startTime,required this.endTime, required this.name});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tạo đơn hàng này'),
      content: const Text('Đơn hàng tạo bởi Admin'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Hủy'),
        ),
        TextButton(
          onPressed: () {
               var data ={'starttime': startTime , 'endtime':endTime , 'm_stadium': name};
            api.createOrder(data).then((value) {
              if(value){
                               
                                 Future.delayed(const Duration(seconds: 0))
                        .then((value) async {
                      
                      Get.offAllNamed('/dashboardView');
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
