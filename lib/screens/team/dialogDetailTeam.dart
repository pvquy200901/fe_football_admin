import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/News_model/news.dart';
import '../../models/Team_model/team.dart';
import '../../models/User_model/User.dart';

class DetailTeamDialog extends StatefulWidget {
  final String team;

  DetailTeamDialog({
    required this.team,
  });

  @override
  _DetailTeamDialogState createState() => _DetailTeamDialogState();
}

class _DetailTeamDialogState extends State<DetailTeamDialog> {
  List<String> imgList = [];
  listTeam info = listTeam();
  bool isLoading = false;
  List<Widget> imageSliders = [];

  loadData() async {
    setState(() {
      isLoading = true;
    });
    info = await api.getInfoTeamForAdmin(widget.team);
    setState(() {
      if (info.imageTeam == null) {
        imgList = [];
      } else {
        imgList = info.imageTeam!;
      }
      imageSliders = imgList
          .map((item) => Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                            "http://localhost:50000/api/File/image/$item",
                            fit: BoxFit.cover,
                            width: 1000.0),
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
    return (isLoading)?CircularProgressIndicator(): AlertDialog(
      title: Center(child: Text("Xem chi tiết")),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tên đội: ${info.name ?? ''}",
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: SizedBox(
              width: 500,
              height: 500,
              child: CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders),
            ),
          ),

          SizedBox(
            height: 10.0,
          ),
          if (info.name != "")
            Text("Tên đội: "+
                info.name!,
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
          info.phone != ""?
          Text("Địa chỉ: "+
              info.address!,
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ): Text("Địa chỉ: "+
              "Không có",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          if (info.quality != "")
            Text("Số lượng: "+
                info.quality.toString(),
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK'),
        ),
      ],
    ) ;
  }
}
