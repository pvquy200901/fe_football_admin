import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../api/api.dart';
import '../../../models/Stadium_model/Stadium.dart';
import '../../input_widget/input_field.dart';
import 'package:dio/dio.dart' as dio;

import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class ItemEditStadium extends StatefulWidget {
  final listStadium models;
  const ItemEditStadium({super.key, required this.models});

  @override
  State<ItemEditStadium> createState() => _ItemEditStadiumPageState();
}

class _ItemEditStadiumPageState extends State<ItemEditStadium> {
  final ImagePicker _picker = ImagePicker();
  Future<PickedFile?> pickedFile = Future.value(null);
  XFile? image;

  String img = '';
  bool visible = true;
  bool isHover = false;
  String textname = '';
  String textphone = '';
  String textaddress = '';
  double textprice = 0.0;

  bool phoneFocus = false;
  bool addressFocus = false;
  bool nameFocus = false;
  bool priceFocus = false;
  final TextEditingController phoneTxt = TextEditingController();
  final TextEditingController nameTxt = TextEditingController();
  final TextEditingController emailTxt = TextEditingController();
  final TextEditingController addressTxt = TextEditingController();
  final TextEditingController priceTxt = TextEditingController();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  listStadium model = listStadium();

  String? get errorPhone {
    final text = phoneTxt.value.text;
    if (text.isEmpty && phoneFocus == true) {
      return 'Vui lòng nhập số liên hệ';
    }
    return null;
  }

  String? get errorName {
    final text = nameTxt.value.text;
    if (text.isEmpty && nameFocus == true) {
      return 'Vui lòng nhập tên sân';
    }
    return null;
  }

  String? get errorAddress {
    final text = addressTxt.value.text;
    if (text.isEmpty && addressFocus == true) {
      return 'Vui lòng nhập địa chỉ';
    }
    return null;
  }

  String? get errorPrice {
    final text = priceTxt.value.text;
    if (text.isEmpty && priceFocus == true) {
      return 'Vui lòng nhập đúng giá tiền sân';
    }
    return null;
  }

  void _displayErrorMotionToast() {
    MotionToast.error(
      title: const Text(
        'Error',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Tạo sân không thành công'),
      animationType: AnimationType.fromBottom,
      position: MotionToastPosition.bottom,
      barrierColor: Colors.transparent,
      width: 300,
      height: 80,
      dismissable: true,
    ).show(context);
  }

  void _displaySuccessMotionToast() {
    MotionToast.success(
      title: const Text(
        'Success',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: const Text('Tạo sân thành công'),
      animationType: AnimationType.fromBottom,
      position: MotionToastPosition.bottom,
      barrierColor: Colors.transparent,
      width: 300,
      height: 80,
      dismissable: true,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    // if(img == ""){
    //   img = 'assets/LOGO_QDN.png';
    // }
    // else{
    //   img = 'http://localhost:50000/api/File/image/${widget.models}'
    // }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "SỬA SÂN BÓNG ${widget.models.name!}",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  // InputField(label: "Địa chỉ", content: widget.models.address!, isHidden: false, controller: addressTxt),
                  // SizedBox(height: 20.0),
                  // InputField(
                  //     label: "Số điện thoại", content: widget.models.contact!, isHidden: false, controller:phoneTxt),
                  // SizedBox(height: 20.0),
                  // InputField(label: "Giá sân", content: widget.models.price.toString(), isHidden: false, controller: priceTxt),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textaddress, addressFocus = true});
                      },
                      controller: addressTxt,
                      decoration: InputDecoration(
                        errorText: errorAddress,
                        hintText: widget.models.address!,
                      )),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textphone, phoneFocus = true});
                      },
                      controller: phoneTxt,
                      decoration: InputDecoration(
                        errorText: errorPhone,
                        hintText: widget.models.contact!,
                      )),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textprice, priceFocus = true});
                      },
                      controller: priceTxt,
                      decoration: InputDecoration(
                        errorText: errorPrice,
                        hintText: widget.models.price.toString(),
                      )),
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
                      spacing: 8.0, // gap between adjacent chips
                      runSpacing: 4.0, // gap between lines
                      children: <Widget>[
                       
                            //mainAxisAlignment: MainAxisAlignment.center,
                            //children: [
                              for (int i = 0;
                                  i < widget.models.images!.length;
                                  i++)
                                ClipRRect(
                                  child: SizedBox.fromSize(
                                    size: Size.fromRadius(95), // Image radius
                                    child: Image.network(
                                        'http://localhost:50000/api/File/image/${widget.models.images![i]}',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                            //]
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
                onPressed: () async {
                  print("Đã bấm");
                  image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    print("=====================${image}");
                    Uint8List bytes = await image!.readAsBytes();
                    var dataImage = dio.MultipartFile.fromBytes(bytes,
                        filename: image!.name,
                        contentType: MediaType.parse(image!.mimeType!));
                    dio.FormData data =
                        dio.FormData.fromMap({'image': dataImage});
                    api.setImageStadium(widget.models.name, data);
                    setState(() {});
                  }
                  Future.delayed(const Duration(seconds: 0))
                      .then((value) async {
                    Get.offAllNamed('/listStadium');
                  });
                },
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
                        var data = {
                          "address": addressTxt.text,
                          "contact": phoneTxt.text,
                          "price": priceTxt.text,
                        };
                        print("${widget.models.name!} + ${data}");
                        api
                            .editStadium(widget.models.name!, data)
                            .then((value) {
                          if (value) {
                            _displaySuccessMotionToast();
                            Future.delayed(const Duration(seconds: 0))
                                .then((value) async {
                              Get.offAllNamed('/listStadium');
                            });
                          } else {
                            _displayErrorMotionToast();
                          }
                        });
                      },
                      child: Text(
                        "Lưu",
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
