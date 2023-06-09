import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../api/api.dart';
import '../../models/Team_model/team.dart';

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
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
    return (isLoading)?const CircularProgressIndicator(): AlertDialog(
      title: const Center(child: Text("Xem chi tiết")),
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
          const SizedBox(
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

          const SizedBox(
            height: 10.0,
          ),
          if (info.name != "")
            Text("Tên đội: ${info.name!}",
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
          info.phone != ""?
          Text("Địa chỉ: ${info.address!}",
            style: const TextStyle(color: Colors.black, fontSize: 16.0),
          ): const Text("Địa chỉ: "+
              "Không có",
            style: TextStyle(color: Colors.black, fontSize: 16.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (info.quality != "")
            Text("Số lượng: ${info.quality}",
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ) ;
  }
}
