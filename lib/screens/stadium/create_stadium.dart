import 'package:fe_football_admin/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../api/api.dart';
import '../../config/style.dart';
import '../../config/text.dart';
import '../dashboard/sidebar.dart';
import 'map.dart';

class createStadiumView extends StatefulWidget {
  const createStadiumView({Key? key}) : super(key: key);

  @override
  _createStadiumViewState createState() => _createStadiumViewState();
}

class _createStadiumViewState extends State<createStadiumView> {

  LatLng? pickedLocation;
  bool isLoading = false;
  int i = 0;
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _contact = TextEditingController();
  final _price = TextEditingController();

  loadingData() async {
    setState(() {
      isLoading = true;
    });


    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadingData();
  }

  @override
  Widget build(BuildContext context) {
    SideBarWidget _sideBar = SideBarWidget();
    return AdminScaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Visibility(
                  child: CustomText(
                    text: 'Quản lý hệ thống',
                    color: lightgrey,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  )),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                color: dark.withOpacity(.7),
                onPressed: () {},
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      color: dark.withOpacity(.7),
                    ),
                  ),
                  Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                          width: 12,
                          height: 12,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: blue,
                              shape: BoxShape.circle,
                              border: Border.all(color: light, width: 2))))
                ],
              ),
              Container(
                width: 1,
                height: 22,
                color: lightgrey,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(
                      Icons.person_outline,
                      color: dark,
                    ),
                  ),
                ),
              )
            ],
          ),
          iconTheme: IconThemeData(
            color: dark,
          ),
          backgroundColor: light,

        ),
        sideBar: _sideBar.SideBarMenus(context, '/listStadium'),
        body: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Thêm sân bóng",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập tên sân';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Tên sân',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: _address,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Vui lòng nhập địa chỉ';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Địa chỉ',
                                  prefixIcon: Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ).margin9,
                              Positioned(
                                  right: 10,
                                  top: 10,
                                  child: IconButton(
                                    onPressed: () async {
                                      final result = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => MapPickerWidget()),
                                      );
                                      setState(() {
                                        pickedLocation = result;
                                      });

                                    },
                                    icon: const Icon(Icons.add_location_alt_outlined),
                                    color: Colors.cyan,
                                  ))
                            ],
                          )),
                    ],
                  ),

                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập số liên lạc';
                      }
                      return null;
                    },
                    controller: _contact,
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      prefixIcon: Icon(Icons.mail_outline_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập giá tiền';
                      }
                      return null;
                    },
                    controller: _price,
                    decoration: InputDecoration(
                      labelText: 'Giá tiền',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      /*print(pickedLocation?.latitude);
                      print(pickedLocation?.longitude);*/
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Loading...'),
                            );
                          });
                      var data = {
                        "name": _name.text,
                        "address": _address.text,
                        "contact": _contact.text,
                        "price": int.parse(_price.text),
                        "latitude": pickedLocation!.latitude.toString(),
                        "longtitude": pickedLocation!.longitude.toString(),
                      };
                      print(data);
                      api.createStadium(data).then((value) {
                        if (value) {
                          Future.delayed(const Duration(seconds: 0))
                              .then((value) async {
                            Get.offAllNamed('/listStadium');
                          });
                        }
                      });

                    },
                    child: Text(
                      'Thêm',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
