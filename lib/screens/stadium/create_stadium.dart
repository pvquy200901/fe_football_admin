import 'package:fe_football_admin/config/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:fluttertoast/fluttertoast.dart';

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


  bool isLoading = false;
  int i = 0;
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _contact = TextEditingController();
  final _price = TextEditingController();
  String _latitude = "";
  String _longtitude ="";
  LatLng? pickedLocation;

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
    SideBarWidget sideBar = SideBarWidget();
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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: light,
                        child:  IconButton(
                          icon: const Icon(Icons.person),
                          color: dark.withOpacity(.7),
                          onPressed: () {
                            setState(() {
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(
            color: dark,
          ),
          backgroundColor: light,

        ),
        sideBar: sideBar.SideBarMenus(context, '/listStadium'),
        body: Column(
          children: [
            Form(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
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
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  const SizedBox(height: 10),
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
                                  prefixIcon: const Icon(Icons.person),
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
                                        _latitude = pickedLocation!.latitude.toString();
                                        _longtitude = pickedLocation!.longitude.toString();
                                      });
                                    },
                                    icon: const Icon(Icons.add_location_alt_outlined),
                                    color: Colors.cyan,
                                  ))
                            ],
                          )),
                    ],
                  ),

                  const SizedBox(height: 10),
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
                      prefixIcon: const Icon(Icons.mail_outline_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  const SizedBox(height: 10),
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
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ).margin9,
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ButtonTheme(
                  child: ElevatedButton(
                    onPressed: () {
                      var data = {
                        "name": _name.text,
                        "address": _address.text,
                        "contact": _contact.text,
                        "price": _price.text,
                        "latitude": _latitude,
                        "longtitude": _longtitude,
                      };
                      api.createStadium(data).then((value) {
                        if (value) {
                          Future.delayed(const Duration(seconds: 0))
                              .then((value) async {
                            Get.offAllNamed('/listStadium');
                          });
                          Fluttertoast.showToast(
                              msg: "Thêm sân thành công",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP_RIGHT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Không thể thêm sân",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.TOP_RIGHT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      });

                    },
                    child: const Text(
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

