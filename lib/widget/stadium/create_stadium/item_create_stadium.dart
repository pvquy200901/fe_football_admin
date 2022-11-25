import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

import '../../../api/api.dart';
import '../../../models/Stadium_model/Stadium.dart';
import '../../input_widget/input_field.dart';

class ItemCreateStadium extends StatefulWidget {
  ItemCreateStadium();

  @override
  State<ItemCreateStadium> createState() => _ItemCreateStadiumPageState();
}

class _ItemCreateStadiumPageState extends State<ItemCreateStadium> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        //height: MediaQuery.of(context).size.height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    "THÊM SÂN BÓNG",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(
                    height: 45,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // InputField( label: "Tên sân", content: "", isHidden: false, controller: nameTxt,),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textname, nameFocus = true});
                      },
                      controller: nameTxt,
                      decoration: InputDecoration(
                        errorText: errorName,
                        hintText: "Tên sân",
                      )),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textaddress, addressFocus = true});
                      },
                      controller: addressTxt,
                      decoration: InputDecoration(
                        errorText: errorAddress,
                        hintText: "Địa chỉ",
                      )),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textphone, phoneFocus = true});
                      },
                      controller: phoneTxt,
                      decoration: InputDecoration(
                        errorText: errorPhone,
                        hintText: "Thông tin liên hệ",
                      )),
                  SizedBox(height: 20.0),
                  TextFormField(
                      onChanged: (value) {
                        setState(() => {textprice, priceFocus = true});
                      },
                      controller: priceTxt,
                      decoration: InputDecoration(
                        errorText: errorPrice,
                        hintText: "Giá sân",
                      )),
                  // SizedBox(height: 20.0),
                  // InputField(label: "Địa chỉ", content: "", isHidden: false, controller:addressTxt),
                  // SizedBox(height: 20.0),
                  // InputField(
                  //     label: "Số điện thoại", content: "", isHidden: false, controller:phoneTxt),
                  // SizedBox(height: 20.0),
                  // InputField(label: "Giá tiền", content: "", isHidden: false, controller: priceTxt),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              // Container(
              //   width: MediaQuery.of(context).size.width / 2,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Wrap(
              //         direction: Axis.horizontal,
              //         alignment: WrapAlignment.center,
              //         spacing: 2.0, // gap between adjacent chips
              //         runSpacing: 1.0, // gap between lines
              //         children: <Widget>[
              //           Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //               ]),
              //           Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //               ]),
              //           Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //                 ClipRRect(
              //                   child: SizedBox.fromSize(
              //                     size: Size.fromRadius(95), // Image radius
              //                     child: Image.network('assets/add-image.png',
              //                         fit: BoxFit.cover),
              //                   ),
              //                 ),
              //               ]),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.red,
              //   ),
              //   onPressed: () {},
              //   child: Text("Thêm ảnh"),
              // ),
              SizedBox(
                height: 150,
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
                          "name": nameTxt.text,
                          "address": addressTxt.text,
                          "contact": phoneTxt.text,
                          "price": priceTxt.text,
                        };
                        api.createStadium(data).then((value) {
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
