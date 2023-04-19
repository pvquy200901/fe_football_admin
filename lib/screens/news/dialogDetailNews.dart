import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/News_model/news.dart';

class DetailNewsDialog extends StatefulWidget {
  final String name;

  DetailNewsDialog(
      {required this.name,
        });

  @override
  _DetailNewsDialogState createState() => _DetailNewsDialogState();
}

class _DetailNewsDialogState extends State<DetailNewsDialog> {

  infoNews info = infoNews();
  bool isLoading = false;
  List<String> img = [];
  loadData() async {
    setState(() {
        isLoading = true;
    });
    info = await api.getInfoNewsForAdmin(widget.name);
    List<String> img = info.imagesNews!;
    setState(() {
      if(info.imagesNews!.isEmpty){
        img =["https://static.standard.co.uk/2022/03/15/19/2022-03-15T172625Z_1107313512_UP1EI3F1CFY2Q_RTRMADP_3_SOCCER-CHAMPIONS-MUN-ATM-REPORT.JPG?width=1200"];
      }
      else{
        img =["http://localhost:50000/api/File/image/${info.imagesNews?[0]}"];
      }
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
    return (isLoading) ? CircularProgressIndicator():SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: AlertDialog(
        //contentPadding: EdgeInsets.all(50),
        title: Center(child: Text("Xem chi tiết")),
        content: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          width: double.infinity,
          decoration: BoxDecoration(
            /*border: Border(bottom: BorderSide(
          color: Colors.black,
          width: 1
        )),*/
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( "Người đăng: "+
                  info.user!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Container(
                    width: 500,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: (info.imagesNews!.isEmpty) ? NetworkImage("https://static.standard.co.uk/2022/03/15/19/2022-03-15T172625Z_1107313512_UP1EI3F1CFY2Q_RTRMADP_3_SOCCER-CHAMPIONS-MUN-ATM-REPORT.JPG?width=1200"):NetworkImage("http://localhost:50000/api/File/image/${info.imagesNews![0]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (info.title != "")
                  Text("Tiêu đề: "+
                    info.title!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                if (info.description != "")
                  Text("Miêu tả: "+
                      info.description!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),

                SizedBox(
                  height: 10.0,
                ),
                if (info.createdTime != "")
                  Text("Thời gian: "+
                      info.createdTime!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
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
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
