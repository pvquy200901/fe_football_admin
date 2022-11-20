import 'package:flutter/material.dart';

import '../../input_widget/input_field.dart';

class ItemCreateStadium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightBlue,
                      radius: 115,
                      child: CircleAvatar(
                        backgroundColor: Colors.lightBlue[100],
                        radius: 110,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "assets/LOGO_QDN.png"), //NetworkImage
                          radius: 100,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    // color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    onPressed: () {},
                    color: Colors.red,
                    child: Text(
                      "Thêm đại diện",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputField(label: "Tên sân", content: "", isHidden: false),
                  SizedBox(height: 20.0),
                  InputField(label: "Địa chỉ", content: "", isHidden: false),
                  SizedBox(height: 20.0),
                  InputField(
                      label: "Số điện thoại", content: "", isHidden: false),
                  SizedBox(height: 20.0),
                  InputField(label: "Email", content: "", isHidden: false),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 2.0, // gap between adjacent chips
                      runSpacing: 1.0, // gap between lines
                      children: <Widget>[
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                child: SizedBox.fromSize(
                                  size: Size.fromRadius(95), // Image radius
                                  child: Image.network('assets/add-image.png',
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ]),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {},
                child: Text("Thêm ảnh"),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Hủy"),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),

                  //Button dành cho người tạo đội
                  Visibility(
                    visible: true,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 60, 134, 245),
                      ),
                      onPressed: () {
                        //Get.to(NextScreen());
                      },
                      child: Text(
                        "Tạo sân",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
