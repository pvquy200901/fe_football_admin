import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api.dart';

class DialogTeamDelete extends StatelessWidget {
  final String team;
  const DialogTeamDelete({super.key, required this.team});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xóa đội này?'),
      content: const Text('Bạn chắc chắn muốn xóa đội này?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Giữ'),
        ),
        TextButton(
          onPressed: () {
            api.removeTeam(team).then((value) {
                          if (value) {
                            Future.delayed(const Duration(seconds: 0))
                                .then((value) async {
                              Get.offAllNamed('/listTeam');
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
