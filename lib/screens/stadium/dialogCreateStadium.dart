import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../api/api.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

import '../../config/style.dart';
import 'map.dart';

class EditInfoDialog extends StatefulWidget {
  final String name;
  final String address;
  final String contact;
  final int price;
  final String latitude;
  final String longtitude;
  final List<String> images;

  EditInfoDialog(
      {required this.name,
      required this.address,
      required this.contact,
      required this.price,
      required this.latitude,
      required this.longtitude,
      required this.images});

  @override
  _EditInfoDialogState createState() => _EditInfoDialogState();
}

class _EditInfoDialogState extends State<EditInfoDialog> {
  final _addressController = TextEditingController();
  final _contactController = TextEditingController();
  final _priceController = TextEditingController();
  String _latitude = "";
  String _longtitude = "";
  LatLng? pickedLocation;
  List<Widget> imageSliders = [];
  List<String> imgList = [];
  bool isLoading = false;
  XFile? image;
  final ImagePicker _picker = ImagePicker();
  Future<PickedFile?> pickedFile = Future.value(null);

  loadData() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      if (widget.images.length == 0) {
        imgList = [
          "https://images2.thanhnien.vn/Uploaded/taynguyen/2022_03_16/oldtrafford-afp-3474.jpeg"
        ];
      } else {
        imgList = widget.images;
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
                        Positioned(
                          top: 5.0,
                          right: 5.0,
                          child: IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.white,
                            onPressed: () {
                              api.removeImageStadium(widget.name, item).then((value){
                                if(value){
                                  Future.delayed(const Duration(seconds: 0))
                                      .then((value) async {
                                    Get.offAllNamed('/listStadium');
                                  });
                                }
                              });
                            },
                          ),
                        )
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
    _addressController.text = widget.address;
    _contactController.text = widget.contact;
    _priceController.text = widget.price.toString();
    _latitude = widget.latitude;
    _longtitude = widget.longtitude;
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      //contentPadding: EdgeInsets.all(50),
      title: Text(widget.name),
      content: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                      labelText: 'Địa chỉ',
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapPickerWidget()),
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
          TextFormField(
            controller: _contactController,
            decoration: InputDecoration(
              labelText: 'Liên hệ',
            ),
          ),
          TextFormField(
            controller: _priceController,
            decoration: InputDecoration(
              labelText: 'Giá',
            ),
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
          IconButton(
              icon: const Icon(Icons.image),
              color: Colors.white,
              onPressed: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  Uint8List bytes = await image!.readAsBytes();
                  var dataImage = dio.MultipartFile.fromBytes(bytes,
                      filename: image!.name,
                      contentType: MediaType.parse(image!.mimeType!));
                  dio.FormData data =
                      dio.FormData.fromMap({'image': dataImage});
                  api.setImageStadium(widget.name, data);

                  Future.delayed(const Duration(seconds: 0)).then((value) async {
                    Get.offAllNamed('/listStadium');
                  });
                }
              }),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Hủy bỏ'),
        ),
        ElevatedButton(
          onPressed: () {
            var data = {
              "name": widget.name,
              "address": _addressController.text,
              "contact": _contactController.text,
              "price": int.parse(_priceController.text),
              "latitude": _latitude,
              "longtitude": _longtitude,
            };
            api.editStadium(data).then((value) {
              if (value) {
                Future.delayed(const Duration(seconds: 0)).then((value) async {
                  Get.offAllNamed('/listStadium');
                });
                Fluttertoast.showToast(
                    msg: "Đã sửa thành công",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: "Chỉnh sửa thất bại",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP_RIGHT,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            });
          },
          child: Text('Lưu'),
        ),
      ],
    );
  }
}
