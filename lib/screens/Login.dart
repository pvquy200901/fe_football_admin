import 'package:fe_football_admin/widget/input_widget/input_password.dart';
import 'package:flutter/material.dart';

import '../api/api.dart';
import '../widget/input_widget/input_field.dart';
import 'dashboard/Dashboard.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = true;
  String textus = '';
  String textpw = '';
  bool isHover = false;
  bool userFocus = false;
  bool passwordFocus = false;
  final TextEditingController userTxt = TextEditingController();
  final TextEditingController passwordTxt = TextEditingController();
  String? get errorUsername {
    final text = userTxt.value.text;
    if (text.isEmpty && userFocus == true) {
      return 'Vui lòng nhập tên đăng nhập';
    }
    return null;
  }

  String? get errorPassword {
    final text = passwordTxt.value.text;
    if (text.isEmpty && passwordFocus == true) {
      return 'Vui lòng nhập mật khẩu';
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
      description: const Text('Đăng nhập thất bại'),
      animationType: AnimationType.fromBottom,
      position: MotionToastPosition.bottom,
      barrierColor: Colors.transparent,
      width: 300,
      height: 80,
      dismissable: true,
    ).show(context);
  }

  Future<bool> user() async {
    return await api.postUser(userTxt.text, passwordTxt.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Padding(
        padding:
            EdgeInsets.only(top: 60.0, bottom: 60.0, left: 120.0, right: 120.0),
        child: Card(
          color: Color.fromARGB(255, 37, 72, 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3.3,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Đăng nhập",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35.0,
                            fontFamily: 'Merriweather'),
                      ),
                      const SizedBox(height: 21.0),

                      //InputField Widget from the widgets folder
                      TextFormField(
                          onChanged: (value) {
                            setState(() => {textus, userFocus = true});
                          },
                          controller: userTxt,
                          decoration: InputDecoration(
                            errorText: errorUsername,
                            hintText: "Tên đăng nhập",
                          )),

                      SizedBox(height: 20.0),

                      TextFormField(
                          onChanged: (value) {
                            setState(() => {textpw, passwordFocus = true});
                          },
                          controller: passwordTxt,
                          obscureText: visible,
                          decoration: InputDecoration(
                            errorText: errorPassword,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  visible = !visible;
                                });
                              },
                              child: Icon(
                                visible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.lightBlue,
                              ),
                            ),
                            hintText: "Mật khẩu",
                          )),
                      SizedBox(height: 20.0),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 60, 134, 245),
                            ),
                            onPressed: () {
                               user().then((value) {
                                if (value) {
                                  Future.delayed(const Duration(seconds: 0))
                                      .then(
                                          (value) => Get.offAllNamed('/dashboardView'));
                                } else {
                                  _displayErrorMotionToast();
                                }
                              });
                            },
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(color: Colors.white),
                            ),
                             onHover: (val) {
                              setState(() {
                                isHover = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
