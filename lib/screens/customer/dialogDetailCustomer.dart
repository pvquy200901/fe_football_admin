import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/News_model/news.dart';
import '../../models/User_model/User.dart';

class DetailCustomerDialog extends StatefulWidget {
  final String username;

  DetailCustomerDialog(
      {required this.username,
      });

  @override
  _DetailCustomerDialogState createState() => _DetailCustomerDialogState();
}

class _DetailCustomerDialogState extends State<DetailCustomerDialog> {

  UserModel info = UserModel();
  bool isLoading = false;
  loadData() async {
    setState(() {
      isLoading = true;
    });
    info = await api.getInfoUser(widget.username);
    setState(() {

      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading) ? const CircularProgressIndicator():SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AlertDialog(
        //contentPadding: EdgeInsets.all(50),
        title: const Center(child: Text("Xem chi tiết")),
        content: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            /*border: Border(bottom: BorderSide(
          color: Colors.black,
          width: 1
        )),*/
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( "Họ và tên: ${info.name!}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: (info.avatar!.isEmpty) ? const NetworkImage("https://cdn-icons-png.flaticon.com/512/3607/3607444.png"):NetworkImage("http://localhost:50000/api/File/image/${info.avatar!}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (info.email != "")
                  Text("Email: ${info.email!}",
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                const SizedBox(
                  height: 10.0,
                ),
                if (info.phone != "")
                  Text("Số điện thoại: ${info.phone!}",
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),

                const SizedBox(
                  height: 10.0,
                ),
                info.team != ""?
                  Text("Đội: ${info.team!}",
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ): const Text("Đội: ""Chưa gia nhập đội bóng",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                if (info.birthday != "")
                  Text("Ngày sinh: ${info.birthday!}",
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
