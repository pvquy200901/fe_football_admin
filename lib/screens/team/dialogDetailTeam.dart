import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/News_model/news.dart';
import '../../models/Team_model/team.dart';
import '../../models/User_model/User.dart';

class DetailTeamDialog extends StatefulWidget {
  final String team;

  DetailTeamDialog(
      {required this.team,
      });

  @override
  _DetailTeamDialogState createState() => _DetailTeamDialogState();
}

class _DetailTeamDialogState extends State<DetailTeamDialog> {
  List<String> imgList =[];
  listTeam info = listTeam();
  bool isLoading = false;
  List<Widget> imageSliders = [];

  loadData() async {
    setState(() {
      isLoading = true;
    });
    info = await api.getInfoTeamForAdmin(widget.team);
    setState(() {
      if(info.imageTeam == null){
        imgList =["https://cdn-icons-png.flaticon.com/512/3607/3607444.png"];
      }
      else{
        imgList = info.imageTeam!;
      }
      imageSliders = imgList
          .map((item) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    (item.isEmpty) ? Image.network("https://cdn-icons-png.flaticon.com/512/3607/3607444.png", fit: BoxFit.cover, width: 1000.0):Image.network("http://localhost:50000/api/File/image/${item}", fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'No. ${imgList.indexOf(item)} image',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ))
          .toList();
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
      child: Scaffold(
        appBar: AppBar(title: Text('Image slider demo')),
        //contentPadding: EdgeInsets.all(50),
       /* title: Center(child: Text("Xem chi tiết")),*/
        body: Container(
          margin: EdgeInsets.only(bottom: 10.0),

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
                Text( "Tên đội: "+
                    info.name!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                     /* aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      autoPlay: true,*/
                    ),
                    items: imgList
                        .map((item) => Center(
                            child:
                            Image.network("http://localhost:50000/api/File/image/${item}", fit: BoxFit.cover, width: 1000)))
                        .toList(),
                  ),
                ),
               /* SizedBox(
                  height: 10.0,
                ),
                if (info.email != "")
                  Text("Email: "+
                      info.email!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                SizedBox(
                  height: 10.0,
                ),
                if (info.phone != "")
                  Text("Số điện thoại: "+
                      info.phone!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),

                SizedBox(
                  height: 10.0,
                ),
                info.team != ""?
                Text("Đội: "+
                    info.team!,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ): Text("Đội: "+
                    "Chưa gia nhập đội bóng",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (info.birthday != "")
                  Text("Ngày sinh: "+
                      info.birthday!,
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),*/
              ],
            ),
          ),
        ),
       /* actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],*/
      ),
    );
  }
}
