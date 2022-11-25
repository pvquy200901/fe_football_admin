import 'dart:html';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import '../../controller/app_controller.dart';
import '../../screens/Login.dart';

class AdminLeftBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [Colors.pinkAccent, Color.fromARGB(255, 33, 12, 48)]),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            customButton: Row(
              children:  <Widget>[
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 14, // Image radius
                  backgroundImage: NetworkImage('images/ex_user.png'),
                ),
                Text(
                  appController.user,
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
              ],
            ),
            customItemsHeights: [
              ...List<double>.filled(MenuItems.firstItems.length, 38),
              8,
              ...List<double>.filled(MenuItems.secondItems.length, 38),
            ],
            items: [
              ...MenuItems.firstItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
              const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
              ...MenuItems.secondItems.map(
                (item) => DropdownMenuItem<MenuItem>(
                  value: item,
                  child: MenuItems.buildItem(item),
                ),
              ),
            ],
            onChanged: (value) {
              MenuItems.onChanged(context, value as MenuItem);
            },
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 7, right: 0),
            dropdownWidth: 160,
            dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.pinkAccent,
            ),
            dropdownElevation: 10,
            offset: const Offset(0, 8),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [profile, home];
  static const List<MenuItem> secondItems = [logout];

  static const profile = MenuItem(text: 'Hồ sơ', icon: Icons.emoji_people);
  static const home = MenuItem(text: 'Trang chính', icon: Icons.home);

  static const logout = MenuItem(text: 'Đăng xuất', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.profile:
      
        break;
      case MenuItems.home:
      
        break;
      
      case MenuItems.logout:
        //Do something
        Future.delayed(const Duration(seconds: 0))
                        .then((value) async {
                      await appController.resetLoginData();
                      Get.offAllNamed('/login');
                    });
        break;
    }
  }
}
